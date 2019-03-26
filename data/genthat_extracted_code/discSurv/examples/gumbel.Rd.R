library(discSurv)


### Name: gumbel
### Title: Gumbel Link Function
### Aliases: gumbel
### Keywords: survival

### ** Examples

# Example with copenhagen stroke study
library(pec)
data(cost)
head(cost)

# Take subsample and convert time to months
costSub <- cost [1:50, ]
costSub$time <- ceiling(costSub$time/30)
costLong <- dataLong(dataSet=costSub, timeColumn="time", censColumn="status")
gumbelModel <- glm(formula=y ~ timeInt + diabetes, data=costLong, family=binomial(link=gumbel()))

# Estimate hazard given prevStroke nad no prevStroke
hazPrevStroke <- predict(gumbelModel, newdata=data.frame(timeInt=factor(1:143), 
diabetes=factor(rep("yes", 143), levels=c("no", "yes"))), type="response")
hazWoPrevStroke <- predict(gumbelModel, newdata=data.frame(timeInt=factor(1:143), 
diabetes=factor(rep("no", 143), levels=c("no", "yes"))), type="response")

# Estimate survival function
SurvPrevStroke <- cumprod(1-hazPrevStroke)
SurvWoPrevStroke <- cumprod(1-hazWoPrevStroke)

# Example graphics of survival curves with and without diabetes
plot(x=1:143, y=SurvWoPrevStroke, type="l", xlab="Months", 
ylab="S (t|x)", las=1, lwd=2, ylim=c(0,1))
lines(x=1:143, y=SurvPrevStroke, col="red", lwd=2)
legend("topright", legend=c("Without diabetes", "Diabetes"), 
lty=1, lwd=2, col=c("black", "red"))



