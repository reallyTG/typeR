library(TSVC)


### Name: plot.TSVC
### Title: Plotting of Varying Coefficient Trees
### Aliases: plot.TSVC

### ** Examples

# Swiss Labour Market 
library(AER)
data("SwissLabor")

# recode factors 
sl <- SwissLabor
sl$participation <- as.numeric(sl$participation)-1
sl$foreign       <- as.numeric(sl$foreign)-1

## Not run: 
##D fit1 <- TSVC(participation~income+age, data=sl, family=binomial(link="logit"), 
##D              nperm=1000, trace=TRUE)
##D plot(fit1, "income")
## End(Not run)




