library(wrapr)


### Name: clean_fit_glm
### Title: Fit a stats::glm without carying back large structures.
### Aliases: clean_fit_glm

### ** Examples


mk_data_example <- function(k) {
  data.frame(
    x1 = rep(c("a", "a", "b", "b"), k),
    x2 = rep(c(0, 0, 0, 1), k),
    y = rep(1:4, k),
    yC = rep(c(FALSE, TRUE, TRUE, TRUE), k),
    stringsAsFactors = FALSE)
}

res_glm <- clean_fit_glm("yC", c("x1", "x2"),
                         mk_data_example(1),
                         family = binomial)
length(serialize(res_glm$model, NULL))

res_glm <- clean_fit_glm("yC", c("x1", "x2"),
                         mk_data_example(10000),
                         family = binomial)
length(serialize(res_glm$model, NULL))

predict(res_glm$model,
        newdata = mk_data_example(1),
        type = "response")




