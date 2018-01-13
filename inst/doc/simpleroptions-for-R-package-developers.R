## ---- include=FALSE------------------------------------------------------
unlink("~/.simpleroptions_vignette")

## ------------------------------------------------------------------------
library(simpleroptions)
pkgOpt <- OptionsManager("~/.simpleroptions_vignette/example.json",
                        default_options = list(option_1 = "value_1",
                                               option_2 = 1234)
                        )

## ------------------------------------------------------------------------
myfun <- function(x = pkgOpt$get("option_1")) {
  print(x)
}

myfun()

## ---- error = TRUE-------------------------------------------------------
pkgOpt$get("option_3")

## ------------------------------------------------------------------------
pkgOpt$set(option_1 = "new_value_1", option_2 = 9999)

## ------------------------------------------------------------------------
myfun()

## ------------------------------------------------------------------------
cat(readr::read_file("~/.simpleroptions_vignette/example.json"))

## ------------------------------------------------------------------------
pkgOpt$current_options

## ------------------------------------------------------------------------
pkgOpt$set(option_3 = "unknown_option")
pkgOpt$current_options

## ---- error = TRUE-------------------------------------------------------
pkgOpt$strict <- TRUE
pkgOpt$set(option_3 = "new_unknown")

