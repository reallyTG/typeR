library(ACSWR)


### Name: olson
### Title: The Olson Heart Lung Dataset
### Aliases: olson
### Keywords: completely randomized design

### ** Examples

data(olson)
par(mfrow=c(2,2))
plot(olson$rpm,olson$Liters_minute,xlim=c(25,175),xlab="RPM",
  ylab="Flow Rate",main="Scatter Plot")
boxplot(Liters_minute~rpm,data=olson,main="Box Plots")
aggregate(olson$Liters_minute,by=list(olson$rpm),mean)
olson_crd <- aov(Liters_minute ~ as.factor(rpm), data=olson)



