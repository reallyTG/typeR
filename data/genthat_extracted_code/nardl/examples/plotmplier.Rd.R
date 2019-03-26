library(nardl)


### Name: plotmplier
### Title: Dynamic multiplier plot
### Aliases: plotmplier

### ** Examples


############################
# Dynamic multipliers plot
############################
# Load data
data(fod)
reg<-nardl(food~inf,p=4,q=4,fod,ic="aic",maxlags = FALSE,graph = TRUE,case=3)
plotmplier(reg,reg$np,1,10)




