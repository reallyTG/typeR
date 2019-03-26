library(lava)


### Name: rmvar
### Title: Remove variables from (model) object.
### Aliases: rmvar rmvar<- kill kill<-
### Keywords: models regression

### ** Examples

m <- lvm()
addvar(m) <- ~y1+y2+x
covariance(m) <- y1~y2
regression(m) <- c(y1,y2) ~ x
### Cancel the covariance between the residuals of y1 and y2
cancel(m) <- y1~y2
### Remove y2 from the model
rmvar(m) <- ~y2




