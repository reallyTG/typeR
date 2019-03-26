library(wrapr)


### Name: clean_fit_lm
### Title: Fit a stats::lm without carying back large structures.
### Aliases: clean_fit_lm

### ** Examples


mk_data_example <- function(k) {
  data.frame(
    x1 = rep(c("a", "a", "b", "b"), k),
    x2 = rep(c(0, 0, 0, 1), k),
    y = rep(1:4, k),
    yC = rep(c(FALSE, TRUE, TRUE, TRUE), k),
    stringsAsFactors = FALSE)
}

res_lm <- clean_fit_lm("y", c("x1", "x2"),
                       mk_data_example(1))
length(serialize(res_lm$model, NULL))

res_lm <- clean_fit_lm("y", c("x1", "x2"),
                       mk_data_example(10000))
length(serialize(res_lm$model, NULL))

predict(res_lm$model,
        newdata = mk_data_example(1))




