library(tsibble)


### Name: future_slide
### Title: Sliding window in parallel
### Aliases: future_slide future_slide future_slide2 future_pslide
###   future_slide_lgl future_slide_chr future_slide_int future_slide_dbl
###   future_slide_dfr future_slide_dfc future_slide2_lgl future_slide2_chr
###   future_slide2_int future_slide2_dbl future_slide2_dfr
###   future_slide2_dfc future_pslide_lgl future_pslide_chr
###   future_pslide_int future_pslide_dbl future_pslide_dfr
###   future_pslide_dfc

### ** Examples

if (!requireNamespace("furrr", quietly = TRUE)) {
  stop("Please install the furrr package to run these following examples.")
}
## Not run: 
##D library(furrr)
##D plan(multiprocess)
##D my_diag <- function(...) {
##D   data <- list(...)
##D   fit <- lm(Count ~ Time, data = data)
##D   tibble(fitted = fitted(fit), resid = residuals(fit))
##D }
##D pedestrian %>%
##D   nest(-Sensor) %>%
##D   mutate(diag = future_map(data, ~ future_pslide_dfr(., my_diag, .size = 48)))
## End(Not run)



