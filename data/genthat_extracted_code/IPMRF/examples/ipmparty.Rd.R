library(IPMRF)


### Name: ipmparty
### Title: IPM casewise with CIT-RF by 'party' for OOB samples
### Aliases: ipmparty
### Keywords: tree multivariate

### ** Examples

#Note: more examples can be found at 
#https://bmcbioinformatics.biomedcentral.com/articles/10.1186/s12859-017-1650-8

## -------------------------------------------------------
## Example from \code{\link[party]{varimp}} in \pkg{party}
## Classification RF
## -------------------------------------------------------

## Not run: 
##D library(party)
##D 
##D #from help in varimp by party package
##D set.seed(290875)
##D readingSkills.cf <- cforest(score ~ ., data = readingSkills,
##D control = cforest_unbiased(mtry = 2, ntree = 50))
##D 
##D # standard importance
##D varimp(readingSkills.cf)
##D 
##D # the same modulo random variation
##D varimp(readingSkills.cf, pre1.0_0 = TRUE)
##D 
##D # conditional importance, may take a while...
##D varimp(readingSkills.cf, conditional = TRUE)
## End(Not run)

#IMP based on CIT-RF (party package)
library(party)

ntree<-50
#readingSkills: data from party package
da<-readingSkills[,1:3] 
set.seed(290875)
readingSkills.cf3 <- cforest(score ~ ., data = readingSkills,
control = cforest_unbiased(mtry = 3, ntree = 50))

#IPM case-wise computed with OOB with party
pupf<-ipmparty(readingSkills.cf3 ,da,ntree)
 
#global IPM
pua<-apply(pupf,2,mean) 
pua

## -------------------------------------------------------
## Example from \code{\link[randomForestSRC]{var.select}} in \pkg{randomForestSRC} 
## Multivariate mixed forests
## -------------------------------------------------------

## Not run: 
##D library(randomForestSRC)
##D 
##D #from help in var.select by randomForestSRC package
##D mtcars.new <- mtcars
##D mtcars.new$cyl <- factor(mtcars.new$cyl)
##D mtcars.new$carb <- factor(mtcars.new$carb, ordered = TRUE)
##D mv.obj <- rfsrc(cbind(carb, mpg, cyl) ~., data = mtcars.new,
##D importance = TRUE)
##D var.select(mv.obj, method = "vh.vimp", nrep = 10) 
##D 
##D #different variables are selected if var.select is repeated 
##D 
## End(Not run)

#IMP based on CIT-RF (party package)
library(randomForestSRC)
mtcars.new <- mtcars

ntree<-500
da<-mtcars.new[,3:10] 
mc.cf <- cforest(carb+ mpg+ cyl ~., data = mtcars.new,
control = cforest_unbiased(mtry = 8, ntree = 500))

#IPM case-wise computing with OOB with party
pupf<-ipmparty(mc.cf ,da,ntree) 

#global IPM
pua<-apply(pupf,2,mean) 
pua

#disp and hp are consistently selected as more important if repeated





