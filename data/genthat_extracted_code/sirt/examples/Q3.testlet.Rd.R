library(sirt)


### Name: Q3.testlet
### Title: Q_3 Statistic of Yen (1984) for Testlets
### Aliases: Q3.testlet
### Keywords: Testlets Local dependence Q3

### ** Examples

#############################################################################
# EXAMPLE 1: data.read. The 12 items are arranged in 4 testlets
#############################################################################
data(data.read)

# estimate the Rasch model
mod <- sirt::rasch.mml2( data.read)
mod$item

# estmate WLEs
mod.wle <- sirt::wle.rasch( dat=data.read, b=mod$item$b )

# Yen's Q3 statistic
mod.q3 <- sirt::Q3( dat=data.read, theta=mod.wle$theta, b=mod$item$b )

# Yen's Q3 statistic with testlets
items <- colnames(data.read)
testlet.matrix <- cbind( substring(  items,1,1), items )
mod.testletq3 <- sirt::Q3.testlet( q3.res=mod.q3,testlet.matrix=testlet.matrix)
mod.testletq3



