library(heplots)


### Name: Parenting
### Title: Father Parenting Competance
### Aliases: Parenting
### Keywords: datasets

### ** Examples

data(Parenting)
require(car)

# fit the MLM
parenting.mod <- lm(cbind(caring, emotion, play) ~ group, data=Parenting)
Anova(parenting.mod)

# Box's M test
boxM(parenting.mod)
plot(boxM(parenting.mod))

parenting.mod <- lm(cbind(caring, emotion, play) ~ group, data=Parenting)
Anova(parenting.mod)
# test contrasts
print(linearHypothesis(parenting.mod, "group1"), SSP=FALSE)
print(linearHypothesis(parenting.mod, "group2"), SSP=FALSE)


heplot(parenting.mod)
# display tests of contrasts
hyp <- list("N:MP" = "group1", "M:P" = "group2")
heplot(parenting.mod, hypotheses=hyp)

# make a prettier plot
heplot(parenting.mod, hypotheses=hyp, asp=1,
       fill=TRUE, fill.alpha=c(0.3,0.1), 
       col=c("red", "blue"), 
       lty=c(0,0,1,1), label.pos=c(1,1,3,2),
       cex=1.4, cex.lab=1.4, lwd=3)

pairs(parenting.mod, fill=TRUE, fill.alpha=c(0.3, 0.1))

## Not run: 
##D heplot3d(parenting.mod, wire=FALSE)
## End(Not run)





