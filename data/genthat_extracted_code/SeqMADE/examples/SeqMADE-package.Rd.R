library(SeqMADE)


### Name: SeqMADE-package
### Title: Network Module-Based Model in the Differential Expression
###   Analysis for RNA-Seq
### Aliases: SeqMADE-package SeqMADE
### Keywords: package

### ** Examples

data(exprs)
data(networkModule)
case <- c("A1","A2","A3","A4","A5","A6","A7")
control <- c("B1","B2","B3","B4","B5","B6","B7")
factors <- Factor(exprs,case,control)
modulematrix <- moduleMatrix(exprs,networkModule)
Result1<- nbGLM(factors,14,networkModule,modulematrix,distribution="NB")
Result2<- nbGLMdir(factors,14,networkModule,modulematrix,distribution="NB")
Result3<- nbGLMdirperm(exprs,case,control,factors,networkModule,
                       modulematrix,10,distribution="NB")



