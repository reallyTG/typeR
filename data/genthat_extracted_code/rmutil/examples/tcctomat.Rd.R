library(rmutil)


### Name: tcctomat
### Title: Create a Time-constant, Inter-individual Covariate (tccov)
###   Object
### Aliases: tcctomat
### Keywords: manip

### ** Examples

x1 <- gl(4,1)
print(tcc1 <- tcctomat(~x1))
covariates(tcc1)
covariates(tcc1, name="x12")
tcctomat(x1)
tcctomat(x1, dataframe=FALSE)
x2 <- c(0,0,1,1)
print(tcc2 <- tcctomat(~x2, units="days"))
covariates(tcc2)
print(tcc3 <- tcctomat(~x1+x2))
covariates(tcc3)
covariates(tcc3, names=c("x12","x2"))
formula(tcc3)
names(tcc3)
print(tcc4 <- tcctomat(data.frame(x1,x2), units=c(NA,"days")))
covariates(tcc4)
print(tcc5 <- tcctomat(data.frame(x1,x2), dataframe=FALSE, units=c(NA,"days")))
covariates(tcc5)



