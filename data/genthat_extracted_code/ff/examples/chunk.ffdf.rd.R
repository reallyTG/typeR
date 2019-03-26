library(ff)


### Name: chunk.ffdf
### Title: Chunk ff_vector and ffdf
### Aliases: chunk.ffdf chunk.ff_vector
### Keywords: IO data

### ** Examples

  x <- data.frame(x=as.double(1:26), y=factor(letters), z=ordered(LETTERS))
  a <- as.ffdf(x)
  ceiling(26 / (300 %/% sum(.rambytes[vmode(a)])))
  chunk(a, BATCHBYTES=300)
  ceiling(13 / (100 %/% sum(.rambytes[vmode(a)])))
  chunk(a, from=1, to = 13, BATCHBYTES=100)
  rm(a); gc()

  message("dummy example for linear regression with biglm on ffdf")
  library(biglm)

  message("NOTE that . in formula requires calculating terms manually
    because . as a data-dependant term is not allowed in biglm")
  form <- Sepal.Length ~ Sepal.Width + Petal.Length + Petal.Width + Species

  lmfit <- lm(form, data=iris)

  firis <- as.ffdf(iris)
  for (i in chunk(firis, by=50)){
    if (i[1]==1){
      message("first chunk is: ", i[[1]],":",i[[2]])
      biglmfit <- biglm(form, data=firis[i,,drop=FALSE])
    }else{
      message("next chunk is: ", i[[1]],":",i[[2]])
      biglmfit <- update(biglmfit, firis[i,,drop=FALSE])
    }
  }

  summary(lmfit)
  summary(biglmfit)
  stopifnot(all.equal(coef(lmfit), coef(biglmfit)))



