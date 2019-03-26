library(IPWboxplot)


### Name: IPW.boxplot
### Title: Boxplot adapted to missing values
### Aliases: IPW.boxplot
### Keywords: quantile boxplot missing inverse probability weighted

### ** Examples



## A real data example

library(mice)
data(boys)
attach(boys)

res1=IPW.boxplot(tv,x=age,main="IPW boxplot of the testicular volume")


# We  can compare the naive and IPW boxplots
res2=IPW.boxplot(tv,x=age,graph="both",main=" ")




