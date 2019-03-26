library(sigr)


### Name: resampleScoreModelPair
### Title: Studentized bootstrap test of strength of
###   scoreFn(yValues,model1Values) > scoreFn(yValues,model1Values).
### Aliases: resampleScoreModelPair

### ** Examples


set.seed(25325)
y <- 1:5
m1 <- c(1,1,2,2,2)
m2 <- c(1,1,1,1,2)
cor(m1,y)
cor(m2,y)
f <- function(modelValues,yValues) {
  if((sd(modelValues)<=0)||(sd(yValues)<=0)) {
    return(0)
  }
  cor(modelValues,yValues)
}
resampleScoreModelPair(m1,m2,y,f)




