library(partools)


### Name: caclassfit,caclasspred,vote,re_code
### Title: Software Alchemy for Machine Learning
### Aliases: caclassfit caclasspred vote re_code

### ** Examples

## Not run: 
##D # set up 'parallel' cluster
##D cls <- makeCluster(2)
##D setclsinfo(cls)
##D # data prep
##D data(prgeng)
##D prgeng$occ <- re_code(prgeng$occ)
##D prgeng$bs <- as.integer(prgeng$educ == 13)
##D prgeng$ms <- as.integer(prgeng$educ == 14)
##D prgeng$phd <- as.integer(prgeng$educ == 15)
##D prgeng$sex <- prgeng$sex - 1
##D pe <- prgeng[,c(1,7,8,9,12,13,14,5)]
##D pe$occ <- as.factor(pe$occ)   # needed for rpart!
##D # go
##D distribsplit(cls,'pe')
##D library(rpart)
##D clusterEvalQ(cls,library(rpart))
##D fit <- caclassfit(cls,"rpart(occ ~ .,data=pe)")
##D predout <- caclasspred(fit,pe,8,type='class')
##D predout$acc  # 0.36 
##D 
##D stopCluster(cls)
## End(Not run)



