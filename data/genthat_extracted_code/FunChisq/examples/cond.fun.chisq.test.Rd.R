library(FunChisq)


### Name: cond.fun.chisq.test
### Title: Conditional Functional Chi-Square Test for Model-Free
###   Conditional Functional Dependency
### Aliases: cond.fun.chisq.test
### Keywords: conditional functional dependency

### ** Examples

# Generate a relationship between variables X and Z
xz = matrix(c(30,2,2, 2,2,40, 2,30,2),ncol=3,nrow=3,
            byrow = TRUE)
# Re-construct X
x = rep(c(1:nrow(xz)),rowSums(xz))
# Re-construct Z
z = c()
for(i in 1:nrow(xz))
  z = c(z,rep(c(1:ncol(xz)),xz[i,]))

# Generate a relationship between variables Z and Y
# Make sure Z retains its distribution
zy = matrix(c(4,30, 30,4, 4,40),ncol=2,nrow=3,
            byrow = TRUE)
# Re-construct Y
y = rep(0,length(z))
for(i in unique(z))
  y[z==i] = rep(c(1:ncol(zy)),zy[i,])

# Tables
table(x,z)
table(z,y)
table(x,y)

# Conditional functional dependency
# Y = f(X) | Z should be false
cond.fun.chisq.test(x=x,y=y,z=z)
# Z = f(X) | Y should be true
cond.fun.chisq.test(x=x,y=z,z=y)
# Y = f(Z) | X should be true
cond.fun.chisq.test(x=z,y=y,z=x)



