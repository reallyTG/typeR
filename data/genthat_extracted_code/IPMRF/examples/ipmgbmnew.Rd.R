library(IPMRF)


### Name: ipmgbmnew
### Title: IPM casewise with gbm object by 'gbm' for new cases, whose
###   responses do not need to be known
### Aliases: ipmgbmnew
### Keywords: tree multivariate

### ** Examples


## Not run: 
##D library(party)
##D library(gbm)
##D gbm=gbm(score ~ ., data = readingSkills, n.trees=50, shrinkage=0.05, interaction.depth=5, 
##D         bag.fraction = 0.5, train.fraction = 0.5, n.minobsinnode = 1, 
##D         cv.folds = 0, keep.data=F, verbose=F)
##D apply(ipmgbmnew(gbm,readingSkills[,-4],50),FUN=mean,2)->gbm_ipm
##D gbm_ipm
## End(Not run)



