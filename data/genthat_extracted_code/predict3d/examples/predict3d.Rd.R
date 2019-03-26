library(predict3d)


### Name: predict3d
### Title: Draw 3d predict plot using package 'rgl'
### Aliases: predict3d

### ** Examples

fit=lm(mpg~hp*wt,data=mtcars)
predict3d(fit,show.error=TRUE)
## No test: 
fit=lm(Sepal.Length~Sepal.Width*Species,data=iris)
predict3d(fit,radius=0.05)
require(TH.data)
fit=glm(cens~pnodes*age*horTh,data=GBSG2,family=binomial)
predict3d(fit)
mtcars$engine=ifelse(mtcars$vs==0,"V-shaped","straight")
fit=lm(mpg~wt*engine,data=mtcars)
predict3d(fit,radius=0.5)
fit=loess(mpg~hp*wt,data=mtcars)
predict3d(fit,radius=4)
## End(No test)



