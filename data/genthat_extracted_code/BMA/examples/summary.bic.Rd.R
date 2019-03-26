library(BMA)


### Name: summary.bic
### Title: Summaries of Bayesian model averaging objects
### Aliases: summary summary.bicreg summary.bic.glm summary.bic.surv
###   summary.glib summary.mc3 print print.bicreg print.bic.glm
###   print.bic.surv print.glib print.mc3
### Keywords: print

### ** Examples

# logistic regression
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

glm.out1<- bic.glm(x, y, OR = 20, glm.family="binomial", 
                   factor.type=TRUE)
summary(glm.out1, conditional = TRUE)



