library(multisensi)


### Name: predict.gsi
### Title: A function to predict multivariate output
### Aliases: predict.gsi

### ** Examples

  data(biomasseX)
  data(biomasseY)
  x=multisensi(design=biomasseX,model=biomasseY,basis=basis.ACP,
               analysis=analysis.anoasg,
               analysis.args=list(formula=2, keep.outputs=TRUE))
  newdata=as.data.frame(apply(biomasseX,2,unique))
  predict(x,newdata)



