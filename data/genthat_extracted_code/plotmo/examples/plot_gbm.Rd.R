library(plotmo)


### Name: plot_gbm
### Title: Plot a gbm model
### Aliases: plot_gbm

### ** Examples

if (require(gbm)) {
    n <- 100                            # toy model for quick demo
    x1 <- 3 * runif(n)
    x2 <- 3 * runif(n)
    x3 <- sample(1:4, n, replace=TRUE)
    y <- x1 + x2 + x3 + rnorm(n, 0, .3)
    data <- data.frame(y=y, x1=x1, x2=x2, x3=x3)
    mod <- gbm(y~., data=data, distribution="gaussian",
               n.trees=300, shrinkage=.1, interaction.depth=3,
               train.fraction=.8, verbose=FALSE)

    plot_gbm(mod)

    # plotres(mod)                      # plot residuals

    # plotmo(mod)                       # plot regression surfaces
}



