library(ACSWR)


### Name: chdage
### Title: Coronary Heart Disease
### Aliases: chdage
### Keywords: logistic regression

### ** Examples

data(chdage)
plot(chdage$AGE,chdage$CHD,xlab="AGE",ylab="CHD Indicator", 
main="Scatter plot for CHD Data")
agegrp <- cut(chdage$AGE,c(19,29,34,39,44,49,54,59,69),include.lowest=TRUE,
labels=c(25,seq(31.5,56.5,5),64.5))
mp <- c(25,seq(31.5,56.5,5),64.5) # mid-points
chd_percent <- prop.table(table(agegrp,chdage$CHD),1)[,2]
points(mp,chd_percent,"l",col="red")



