library(TSVC)


### Name: summary.TSVC
### Title: Summary of Tree-Structured Varying Coefficient Models
### Aliases: summary.TSVC print.summary.TSVC

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
##D summary(fit1)
## End(Not run)





