library(plotmo)


### Name: plot_glmnet
### Title: Plot a glmnet model
### Aliases: plot_glmnet

### ** Examples

if (require(glmnet)) {
    x <- matrix(rnorm(100 * 10), 100, 10)   # n=100 p=10
    y <- x[,1] + x[,2] + 2 * rnorm(100)     # y depends only on x[,1] and x[,2]
    mod <- glmnet(x, y)

    plot_glmnet(mod)

    # plotres(mod)                          # plot the residuals
}



