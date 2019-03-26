library(Rearrangement)


### Name: lprq2
### Title: Local Linear Regression Methods for Conditional Quantile
###   Functions
### Aliases: lprq2
### Keywords: regression

### ** Examples

require(quantreg)
data(GrowthChart)
attach(GrowthChart)

ages <- unique(sort(age))
llq.fit1 <- lprq2(age,height,h=1,xx=ages,tau=0.2)
detach(GrowthChart)



