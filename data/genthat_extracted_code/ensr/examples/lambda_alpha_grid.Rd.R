library(ensr)


### Name: lambda_alpha_grid
### Title: Lambda Alpha Grid
### Aliases: lambda_alpha_grid

### ** Examples


data(tbi)
Xmat <- model.matrix( ~ . - injury1 - injury2 - injury3 - 1, data = tbi)
Yvec <- matrix(tbi$injury1, ncol = 1)
alphas <- seq(0, 1, length = 20)

lga <- lambda_alpha_grid(alphas = alphas, lambdas = lambda_max(Yvec, Xmat, alpha = alphas))

ggplot2::ggplot() +
  ggplot2::theme_bw() +
  ggplot2::aes_string(x = "a", y = "log10(l)") +
  ggplot2::geom_path(data = lga$top) +
  ggplot2::geom_point(data = lga$lgrid,
                      mapping = ggplot2::aes(color = cos(a) + sin(log10(l)))) +
  ggplot2::geom_contour(data = lga$lgrid,
                        mapping = ggplot2::aes(z = cos(a) + sin(log10(l)))) +
  ggplot2::scale_color_gradient2(low = "blue", high = "red", mid = "grey")




