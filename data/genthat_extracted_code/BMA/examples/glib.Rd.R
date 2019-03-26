library(BMA)


### Name: glib
### Title: Model uncertainty in generalized linear models using Bayes
###   factors
### Aliases: glib glib.matrix glib.data.frame glib.bic.glm as.bic.glm
###   as.bic.glm.glib
### Keywords: regression models

### ** Examples


## Not run: 
##D ### Finney data
##D data(vaso)
##D x<- vaso[,1:2]
##D y<- vaso[,3]
##D n<- rep(1,times=length(y))
##D 
##D finney.models<- rbind(
##D     c(1, 0),
##D     c(0, 1),
##D     c(1, 1))
##D 
##D finney.glib <- glib (x,y,n, error="binomial", link="logit", 
##D                      models=finney.models, glimvar=TRUE, 
##D                      output.priorvar=TRUE, output.postvar=TRUE)
##D summary(finney.glib)
##D 
##D finney.bic.glm<- as.bic.glm(finney.glib)
##D plot(finney.bic.glm,mfrow=c(2,1))
## End(Not run)

### Yates (teeth) data. 

x<- rbind(
    c(0, 0, 0),
    c(0, 1, 0),
    c(1, 0, 0),
    c(1, 1, 1))

y<-c(4, 16, 1, 21)
n<-c(1,1,1,1)

models<- rbind(
    c(1, 1, 0),
    c(1, 1, 1))

glib.yates <- glib ( x, y, n, models=models, glimvar=TRUE,
                     output.priorvar=TRUE, output.postvar=TRUE) 
summary(glib.yates)

## Not run: 
##D ### logistic regression with no models specified
##D library("MASS")
##D data(birthwt)
##D y<- birthwt$lo
##D x<- data.frame(birthwt[,-1])
##D x$race<- as.factor(x$race)
##D x$ht<- (x$ht>=1)+0
##D x<- x[,-9]
##D x$smoke <- as.factor(x$smoke)
##D x$ptl<- as.factor(x$ptl)
##D x$ht <- as.factor(x$ht)
##D x$ui <- as.factor(x$ui)
##D 
##D glib.birthwt<- glib(x,y, error="binomial", link = "logit")
##D summary(glib.birthwt)
##D 
##D glm.birthwt<- as.bic.glm(glib.birthwt)
##D 
##D imageplot.bma(glm.birthwt)
##D plot(glm.birthwt)
## End(Not run)





