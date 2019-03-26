library(DiceKriging)


### Name: plot
### Title: Diagnostic plot for the validation of a km object
### Aliases: plot plot.km plot,km-method
### Keywords: models methods

### ** Examples

# A 2D example - Branin-Hoo function

# a 16-points factorial design, and the corresponding response
d <- 2; n <- 16
fact.design <- expand.grid(seq(0,1,length=4), seq(0,1,length=4))
fact.design <- data.frame(fact.design); names(fact.design)<-c("x1", "x2")
branin.resp <- data.frame(branin(fact.design)); names(branin.resp) <- "y" 

# kriging model 1 : gaussian covariance structure, no trend, 
#                   no nugget effect
m1 <- km(~.^2, design=fact.design, response=branin.resp, covtype="gauss")
plot(m1)  # LOO without parameter reestimation
plot(m1, trend.reestim=TRUE)  # LOO with trend parameters reestimation 
                              # (gives nearly the same result here)



