library(hnp)


### Name: cbb
### Title: Coffee berry borer trapping data
### Aliases: cbb
### Keywords: datasets

### ** Examples

data(cbb)
# exploratory plot
require(latticeExtra)
trellis.par.set(strip.background=list(col="lightgrey"))
useOuterStrips(xyplot(count ~ week | block + trap, data=cbb,
  layout=c(3,1),type="l", col=1, xlab="Week", ylab="Insect counts"))

# Poisson fit
model1 <- glm(count ~ block + trap*factor(week),
              data=cbb, family=poisson)
anova(model1, test="Chisq")
sum(resid(model1, ty="pearson")^2)
summary(model1)
hnp(model1, sim=19, conf=1)

## Not run: 
##D hnp(model1) # default call
## End(Not run)

# Quasi-Poisson fit
model2 <- glm(count ~ block + trap*factor(week), data=cbb,
              family=quasipoisson)
anova(model2, test="F")
summary(model2)
hnp(model2, sim=19, conf=1)

## Not run: 
##D hnp(model2) # default call
## End(Not run)

## for discussion on the analysis of this data set,
## see Demetrio et al. (2014)



