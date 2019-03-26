library(discSurv)


### Name: adjDevResid
### Title: Adjusted Deviance Residuals
### Aliases: adjDevResid
### Keywords: survival

### ** Examples

# Example with cross validation and unemployment data 
library(Ecdat)
data(UnempDur)
summary(UnempDur$spell)

# Extract subset of data
set.seed(635)
IDsample <- sample(1:dim(UnempDur)[1], 100)
UnempDurSubset <- UnempDur [IDsample, ]

# Calculate adjusted deviance residuals for the unemployment data subset
adjDevianceResiduals <- adjDevResid (dataSet=UnempDurSubset, 
survModelFormula=spell ~ age + logwage, 
censColumn="censor1", linkFunc="logit", idColumn=NULL)
adjDevianceResiduals

# Exclude outliers
adjDevResidWoOut <- adjDevianceResiduals$Output$AdjDevResid [
adjDevianceResiduals$Output$AdjDevResid < 
quantile(adjDevianceResiduals$Output$AdjDevResid, prob=0.9) & 
adjDevianceResiduals$Output$AdjDevResid > 
quantile(adjDevianceResiduals$Output$AdjDevResid, prob=0.1)]

# Compare nonparametric density estimate of adjusted deviance residuals 
# with adapted normal distribution
plot(density(adjDevResidWoOut), xlim=c(-10,10), 
main="Density comparison: Normal vs nonparametric estimate", lwd=2, las=1, col="red")
dnorm1 <- function (x) {dnorm (x, mean=mean(adjDevResidWoOut), sd=sd(adjDevResidWoOut))}
curve (dnorm1, n=500, add=TRUE, col="black", lwd=2)
legend("topright", legend=c("Normal", "Nonpar"), lty=1, lwd=2, col=c("black", "red"))



