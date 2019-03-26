library(ICS)


### Name: screeplot.ics
### Title: Screeplot for an ICS Object
### Aliases: screeplot.ics
### Keywords: hplot

### ** Examples

set.seed(654321)
A <- matrix(c(3,2,1,2,4,-0.5,1,-0.5,2),ncol=3)
eigen.A <- eigen(A)
sqrt.A <- eigen.A$vectors %*% (diag(eigen.A$values))^0.5 %*% t(eigen.A$vectors)
normal.ic <- cbind(rnorm(800), rnorm(800), rnorm(800))
mix.ic <- cbind(rt(800,4), rnorm(800), runif(800,-2,2))

data.normal <- normal.ic %*% t(sqrt.A)
data.mix <- mix.ic %*% t(sqrt.A)

par(mfrow=c(1,2))
screeplot(ics(data.normal))
screeplot(ics(data.mix), type="lines")
par(mfrow=c(1,1))
rm(.Random.seed)

screeplot(ics(data.normal), names.arg=paste("IC", 1:ncol(A), sep=""), xlab="")



