library(bmrm)


### Name: ontologyLoss
### Title: Ontology Loss Function
### Aliases: ontologyLoss

### ** Examples

  # -- Load the data
  x <- cbind(intercept=100,data.matrix(iris[1:4]))
  dag <- matrix(nrow=nlevels(iris$Species),byrow=TRUE,dimnames=list(levels(iris$Species)),c(
      1,0,0,0,
      0,1,1,0,
      0,1,0,1
  ))
  w <- nrbm(ontologyLoss(x,iris$Species,dag=dag))
  table(predict(w,x),iris$Species)



