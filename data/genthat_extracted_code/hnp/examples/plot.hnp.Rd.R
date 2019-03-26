library(hnp)


### Name: plot.hnp
### Title: Plot Method for hnp Objects
### Aliases: plot.hnp
### Keywords: plot hnp

### ** Examples

## Simple Poisson regression
set.seed(100)
counts <- c(rpois(5, 2), rpois(5, 4), rpois(5, 6), rpois(5, 8))
treatment <- gl(4, 5)
fit <- glm(counts ~ treatment, family=poisson)
anova(fit, test="Chisq")

## half-normal plot
hnp(fit)

## or save it in an object and then use the plot method
my.hnp <- hnp(fit, print.on=TRUE, plot=FALSE)
plot(my.hnp)

## changing graphical parameters
plot(my.hnp, lty=2, pch=4, cex=1.2)
plot(my.hnp, lty=c(2,3,2), pch=4, cex=1.2, col=c(2,2,2,1))
plot(my.hnp, main="Half-normal plot", xlab="Half-normal scores",
     ylab="Deviance residuals", legpos="bottomright")



