library(sigr)


### Name: resampleScoreModel
### Title: Studentized bootstrap variance estimate for
###   scoreFn(yValues,modelValues).
### Aliases: resampleScoreModel

### ** Examples


set.seed(25325)
y <- 1:5
m1 <- c(1,1,2,2,2)
cor.test(m1,y,alternative='greater')
f <- function(modelValues,yValues) {
 if((sd(modelValues)<=0)||(sd(yValues)<=0)) {
   return(0)
 }
 cor(modelValues,yValues)
}
s <- sigr::resampleScoreModel(m1,y,f)
print(s)
z <- (s$observedScore-0)/s$sd # should check size of z relative to bias!
pValue <- pt(z,df=length(y)-2,lower.tail=FALSE)
pValue





