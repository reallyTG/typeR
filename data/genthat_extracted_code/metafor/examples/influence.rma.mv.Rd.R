library(metafor)


### Name: hatvalues.rma.mv
### Title: Outlier and Influential Case Diagnostics for 'rma.mv' Objects
### Aliases: cooks.distance.rma.mv hatvalues.rma.mv
### Keywords: models

### ** Examples

### multilevel random-effects model
res <- rma.mv(yi, vi, random = ~ 1 | district/school, data=dat.konstantopoulos2011)
print(res, digits=3)

### Cook's distances
x <- cooks.distance(res)
x
plot(x, type="o", pch=19)

### hat values
hatvalues(res)



