library(vows)


### Name: lm4d
### Title: Voxelwise linear models
### Aliases: lm4d

### ** Examples


data(test)
d4 = test$d4
x = test$x
lmobj = lm4d(d4, ~x)

# Convert d4 to a matrix, and confirm that lm.mp() gives the same results as lm4d()
d4.2 = d4
dim(d4.2) = c(prod(dim(d4)[1:3]), dim(d4)[4])
Y = t(d4.2)
lmobj2 = lm.mp(Y, ~x)
all.equal(lmobj$coef, lmobj2$coef)



