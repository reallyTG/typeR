library(CpGassoc)


### Name: design
### Title: Create full and reduced design matrices for the cpg.assoc
###   function.
### Aliases: design design.data.frame design.NULL
### Keywords: ~kwd1 ~kwd2

### ** Examples

data(samplecpg,samplepheno,package="CpGassoc")
#Example where there are covariates:
covar<-data.frame(samplepheno$weight,samplepheno$Distance)
test<-design(covar,samplepheno$SBP,samplepheno$chip,FALSE)
dim(test$full)
dim(test$reduced)
test$reduced[1:5,1:5]
test$full[1:5,1:5]
#When no covariates or chip.id:
test2<-design(NULL,samplepheno$SBP,NULL,FALSE)
dim(test2$full)
dim(test2$reduced)



