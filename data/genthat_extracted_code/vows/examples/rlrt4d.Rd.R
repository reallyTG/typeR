library(vows)


### Name: rlrt4d
### Title: Voxelwise restricted likelihood ratio tests
### Aliases: rlrt4d

### ** Examples


data(test)
d4 = test$d4
x = test$x
rlrtobj = rlrt4d(d4, x, loginvsp = -5:5)
plot(rlrtobj, d4, slice=5)



