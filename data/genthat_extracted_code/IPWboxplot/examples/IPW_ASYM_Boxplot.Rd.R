library(IPWboxplot)


### Name: IPW.ASYM.boxplot
### Title: Boxplot adapted to skewness and missing values
### Aliases: IPW.ASYM.boxplot
### Keywords: quantile boxplot missing inverse probability weighted

### ** Examples


## A real data example


library(mice)
data(boys)
attach(boys)

# The function plots the IPW boxplot adapted to skewness.
# Some statistical summaries computed using the inverse probability weighting approach
# are also returned.
res1=IPW.ASYM.boxplot(hc,x=age,main="IPW boxplot adjusted for skewness of the head circumference")

# We can compare the naive and IPW approaches. We also can consider the skewness measure computed
# using the  quartiles (as default).
res2=IPW.ASYM.boxplot(hc,x=age,method="quartile",graph="both",main=" ")

# The results obtained if the skewness measure is computed with the octiles (method="octile") are:

res3=IPW.ASYM.boxplot(hc,x=age,method="octile",graph="both",main=" ")




