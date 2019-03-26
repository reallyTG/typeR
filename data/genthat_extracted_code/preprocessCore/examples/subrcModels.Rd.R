library(preprocessCore)


### Name: subrcModels
### Title: Fit row-column model to a matrix
### Aliases: subrcModelPLM subrcModelWPLM subrcModelMedianPolish
### Keywords: models

### ** Examples


y <- matrix(c(10+rnorm(50),20+rnorm(50)),20,5,byrow=TRUE)

subrcModelPLM(y,c(rep(1,10),rep(2,10)))
subrcModelMedianPolish(y,c(rep(1,10),rep(2,10)))



col.effects <- c(10,11,10.5,12,9.5)
row.effects <- c(seq(-0.5,-0.1,by=0.1),seq(0.1,0.5,by=0.1))


y <- outer(row.effects, col.effects,"+")
w <- runif(50)

rcModelPLM(y)
rcModelWPLM(y, w)
rcModelMedianPolish(y)

y <- y + rnorm(50)

rcModelPLM(y)
rcModelWPLM(y, w)
rcModelMedianPolish(y)



rcModelPLM(y,row.effects=row.effects)
rcModelWPLM(y,w,row.effects=row.effects)

rcModelPLM(y,input.scale=1.0)
rcModelWPLM(y, w,input.scale=1.0)
rcModelPLM(y,row.effects=row.effects,input.scale=1.0)
rcModelWPLM(y,w,row.effects=row.effects,input.scale=1.0)







