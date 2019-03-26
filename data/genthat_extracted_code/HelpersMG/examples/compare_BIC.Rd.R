library(HelpersMG)


### Name: compare_BIC
### Title: Compares the BIC of several outputs
### Aliases: compare_BIC

### ** Examples

## Not run: 
##D library("HelpersMG")
##D # Here two different models are fitted
##D x <- 1:30
##D y <- rnorm(30, 10, 2)+log(x)
##D plot(x, y)
##D d <- data.frame(x=x, y=y)
##D m1 <- lm(y ~ x, data=d)
##D m2 <- lm(y ~ log(x), data=d)
##D compare_BIC(linear=m1, log=m2, factor.value=-1)
##D # Here test if two datasets can be modeled with a single model
##D x2 <- 1:30
##D y2 <- rnorm(30, 15, 2)+log(x2)
##D plot(x, y, ylim=c(5, 25))
##D plot_add(x2, y2, col="red")
##D d2 <- data.frame(x=x2, y=y2)
##D m1_2 <- lm(y ~ x, data=d2)
##D x_grouped <- c(x, x2)
##D y_grouped <- c(y, y2)
##D d_grouped <- data.frame(x=x_grouped, y=y_grouped)
##D m1_grouped <- lm(y ~ x, data=d_grouped)
##D compare_BIC(separate=list(m1, m1_2), grouped=m1_grouped, factor.value=-1)
## End(Not run)



