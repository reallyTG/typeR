library(partools)


### Name: ca,cabase,calm,caglm,caprcomp,cakm,cameans,caquantile,caagg,caknn
### Title: Software Alchemy: Turning Complex Statistical Computations into
###   Embarrassingly-Parallel Ones
### Aliases: ca cabase calm caglm caprcomp cakm cameans caquantile caagg
###   caknn

### ** Examples


# set up 'parallel' cluster
cls <- makeCluster(2)
setclsinfo(cls)

# generate simulated test data, as distributed data frame
n <- 10000
p <- 2
tmp <- matrix(rnorm((p+1)*n),nrow=n)
u <- tmp[,1:p]  # "X" values
# add a "Y" col
u <- cbind(u,u %*% rep(1,p) + tmp[,p+1])
# now in u, cols 1,2 are the "X" variables, and col 3 is "Y", 
# with regress coefs (0,1,1), with tmp[,p+1] being the error term
distribsplit(cls,"u")  # form distributed d.f.
# apply the function
#### calm(cls,"u[,3] ~ u[,1]+u[,2]")$tht
calm(cls,"V3 ~ .,data=u")$tht
# check; results should be approximately the same
lm(u[,3] ~ u[,1]+u[,2])
# without the wrapper
ovf <- function(dummy=NULL) lm(V3 ~ .,data=z168)
ca(cls,u,ovf,estf=coef,estcovf=vcov)$tht

## Not run: 
##D # Census data on programmers and engineers; include a quadratic term for
##D # age, due to nonmonotone relation to income
##D data(prgeng) 
##D distribsplit(cls,"prgeng") 
##D caout <- calm(cls,"wageinc ~ age+I(age^2)+sex+wkswrkd,data=prgeng")
##D caout$tht
##D # compare to nonparallel
##D lm(wageinc ~ age+I(age^2)+sex+wkswrkd,data=prgeng)
##D # get standard errors of the beta-hats
##D sqrt(diag(caout$thtcov))
##D 
##D # find mean age for all combinations of the cit and sex variables
##D caagg(cls,"age",c("cit","sex"),"prgeng","mean") 
##D # compare to nonparallel
##D aggregate(age ~ cit+sex,data=prgeng,mean)  
##D 
##D data(newadult) 
##D distribsplit(cls,"newadult") 
##D caglm(cls," gt50 ~ ., family = binomial,data=newadult")$tht 
##D 
##D caprcomp(cls,'newadult,scale=TRUE',5)$sdev
##D prcomp(newadult,scale=TRUE)$sdev
##D 
##D cameans(cls,"prgeng")
##D cameans(cls,"prgeng[,c('age','wageinc')]")
##D caquantile(cls,'prgeng$age')
##D 
##D pe <- prgeng[,c(1,3,8)] 
##D distribsplit(cls,"pe") 
##D z1 <- cakm(cls,'pe',3,3); z1$size; z1$centers 
##D # check algorithm unstable
##D z1$thts  # looks unstable
##D 
##D pe <- prgeng 
##D pe$ms <- as.integer(pe$educ == 14) 
##D pe$phd <- as.integer(pe$educ == 16) 
##D pe <- pe[,c(1,7,8,9,12,13)] 
##D distribsplit(cls,'pe',scramble=TRUE)
##D kout <- caknn(cls,'pe[,3]',50,'pe[,-3]') 
## End(Not run)

stopCluster(cls)




