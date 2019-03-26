library(evtree)


### Name: GermanCredit
### Title: Statlog German Credit
### Aliases: GermanCredit
### Keywords: datasets

### ** Examples

data("GermanCredit")
summary(GermanCredit)
## Not run: 
##D gcw <- array(1, nrow(GermanCredit))
##D gcw[GermanCredit$credit_risk == "bad"] <- 5
##D set.seed(1090)
##D gct <- evtree(credit_risk ~ . , data = GermanCredit, weights = gcw) 
##D gct
##D table(predict(gct), GermanCredit$credit_risk)
##D plot(gct)
## End(Not run)



