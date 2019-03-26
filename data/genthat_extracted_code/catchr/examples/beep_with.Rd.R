library(catchr)


### Name: beep_with
### Title: Play short sounds
### Aliases: beep_with

### ** Examples

warning_in_middle <- function() {
  Sys.sleep(2)
  message("It's time!")
  Sys.sleep(2)
  invisible("done")
}

if (requireNamespace("beepr", quietly = TRUE) == TRUE) {
  catch_expr(warning_in_middle(),
             message = c(beep_with(2), display, muffle))
  # Or you can just use the default sound with "beep":
  catch_expr(warning_in_middle(), message = c(beep, display, muffle))
}



