library(fda.usc)


### Name: PCvM.statistic
### Title: PCvM statistic for the Functional Linear Model with scalar
###   response
### Aliases: PCvM.statistic Adot
### Keywords: htest

### ** Examples


# Functional process
X=rproc2fdata(n=10,t=seq(0,1,l=101))

# Adot
Adot.vec=Adot(X)

# Obtain the entire matrix Adot
Ad=diag(rep(Adot.vec[1],dim(X$data)[1]))
Ad[upper.tri(Ad,diag=FALSE)]=Adot.vec[-1]
Ad=t(Ad)
Ad=Ad+t(Ad)-diag(diag(Ad))
Ad

# Statistic
PCvM.statistic(X,residuals=rnorm(10),p=5)




