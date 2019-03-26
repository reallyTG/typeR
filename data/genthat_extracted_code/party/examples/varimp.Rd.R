library(party)


### Name: varimp
### Title: Variable Importance
### Aliases: varimp varimpAUC
### Keywords: tree

### ** Examples

    
   set.seed(290875)
   readingSkills.cf <- cforest(score ~ ., data = readingSkills, 
       control = cforest_unbiased(mtry = 2, ntree = 50))

   # standard importance
   varimp(readingSkills.cf)
   # the same modulo random variation
   varimp(readingSkills.cf, pre1.0_0 = TRUE)

   # conditional importance, may take a while...
   varimp(readingSkills.cf, conditional = TRUE)

   ## Not run: 
##D    data("GBSG2", package = "TH.data")
##D    ### add a random covariate for sanity check
##D    set.seed(29)
##D    GBSG2$rand <- runif(nrow(GBSG2))
##D    object <- cforest(Surv(time, cens) ~ ., data = GBSG2, 
##D                      control = cforest_unbiased(ntree = 20)) 
##D    vi <- varimp(object)
##D    ### compare variable importances and absolute z-statistics
##D    layout(matrix(1:2))
##D    barplot(vi)
##D    barplot(abs(summary(coxph(Surv(time, cens) ~ ., data = GBSG2))$coeff[,"z"]))
##D    ### looks more or less the same
##D    
## End(Not run)



