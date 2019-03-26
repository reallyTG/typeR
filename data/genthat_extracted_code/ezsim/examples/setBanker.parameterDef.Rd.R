library(ezsim)


### Name: setBanker.parameterDef
### Title: Set a parameterDef Object.
### Aliases: setBanker.parameterDef
### Keywords: parameterDef

### ** Examples

par_def1<-createParDef(selection=list(mean=1,sd=2,n=seq(10,50,10)))

par_def2<-createParDef()
setSelection(par_def2,mean=1,sd=2,n=seq(10,50,10))

identical(par_def1,par_def2)

evalFunctionOnParameterDef(par_def1, function() rnorm(n,mean,sd) )  # 10 random number
evalFunctionOnParameterDef(par_def1, function() rnorm(n,mean,sd), index=3)  # 30 random number

generate(par_def1)

# More than 1 selection parameters
par_def3<-createParDef(selection=list(sd=2,mean=1:3,n=seq(10,50,10)))

generate(par_def3)

#
par_def4<-createParDef(selection=list(mean=1,sd=2,n=seq(10,50,10)))
setBanker(par_def4,some_matrix=matrix(1:4,nrow=2),some_vector=1:6)
par_def4
generate(par_def4)



