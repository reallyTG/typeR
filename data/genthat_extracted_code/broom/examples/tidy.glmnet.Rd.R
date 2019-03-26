library(broom)


### Name: tidy.glmnet
### Title: Tidy a(n) glmnet object
### Aliases: tidy.glmnet glmnet_tidiers

### ** Examples


if (requireNamespace("glmnet", quietly = TRUE)) {

    library(glmnet)
    
    set.seed(2014)
    x <- matrix(rnorm(100*20),100,20)
    y <- rnorm(100)
    fit1 <- glmnet(x,y)

    tidy(fit1)
    glance(fit1)

    library(dplyr)
    library(ggplot2)

    tidied <- tidy(fit1) %>% filter(term != "(Intercept)")

    ggplot(tidied, aes(step, estimate, group = term)) + geom_line()
    ggplot(tidied, aes(lambda, estimate, group = term)) +
        geom_line() + scale_x_log10()

    ggplot(tidied, aes(lambda, dev.ratio)) + geom_line()

    # works for other types of regressions as well, such as logistic
    g2 <- sample(1:2, 100, replace=TRUE)
    fit2 <- glmnet(x, g2, family="binomial")
    tidy(fit2)
}




