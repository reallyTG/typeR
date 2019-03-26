library(PracTools)


### Name: NRadjClass
### Title: Class-based nonresponse adjustments
### Aliases: NRadjClass
### Keywords: methods survey

### ** Examples

require(PracTools)
data(nhis)
out <- pclass(formula = resp ~ age + as.factor(sex) + as.factor(hisp) + as.factor(race),
         data = nhis, type = "unwtd", link="logit", numcl=5)
    # unweighted average of response propensities within each class
zz <- NRadjClass(ID=nhis[,"ID"], NRclass = as.numeric(out$p.class), resp=nhis[,"resp"],
            preds=out$propensities, wts=NULL, type=1)



