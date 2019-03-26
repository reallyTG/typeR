library(cumSeg)


### Name: jumpoints
### Title: Change point estimation in piecewise constant models
### Aliases: jumpoints
### Keywords: model regression

### ** Examples


## Not run: 
##D n<-100
##D x<-1:n/n
##D  
##D lp<-I(x>.1) -1*I(x>.15)+.585*I(x>.45)-.585*I(x>.6) -I(x>.9)
##D e<-rnorm(n,0,.154)
##D y<-lp+e #data
##D 
##D #fit the model without selecting the changepoints
##D o1<-jumpoints(y,output="1")
##D plot(o1,y=TRUE, add=FALSE)
##D lines(lp, col=2) #true regression function
##D 
##D #fit model and select the changepoints
##D o2<-jumpoints(y,output="2")
##D plot(o2,y=TRUE, add=FALSE)
##D lines(lp, col=2) #true regression function
## End(Not run)
    


