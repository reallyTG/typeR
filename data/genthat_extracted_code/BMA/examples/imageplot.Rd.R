library(BMA)


### Name: imageplot.bma
### Title: Images of models used in Bayesian model averaging
### Aliases: imageplot.bma
### Keywords: regression models

### ** Examples

# logistic regression using bic.glm
library("MASS")
data(birthwt)
y<- birthwt$lo
x<- data.frame(birthwt[,-1])
x$race<- as.factor(x$race)
x$ht<- (x$ht>=1)+0
x<- x[,-9]
x$smoke <- as.factor(x$smoke)
x$ptl<- as.factor(x$ptl)
x$ht <- as.factor(x$ht)
x$ui <- as.factor(x$ui)

glm.out1<- bic.glm(x, y, strict = TRUE, OR = 20, glm.family="binomial")
imageplot.bma(glm.out1)

## Not run: 
##D # logistic regression using glib
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
##D glm.birthwt<- as.bic.glm(glib.birthwt)
##D imageplot.bma(glm.birthwt, order = "mds")
## End(Not run)



