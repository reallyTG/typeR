library(psych)


### Name: sim.congeneric
### Title: Simulate a congeneric data set
### Aliases: congeneric.sim sim.congeneric make.congeneric
### Keywords: multivariate datagen

### ** Examples

test <- sim.congeneric(c(.9,.8,.7,.6))   #just the population matrix
test <- sim.congeneric(c(.9,.8,.7,.6),N=100)   # a sample correlation matrix
test <- sim.congeneric(short=FALSE, N=100)
round(cor(test$observed),2) # show  a congeneric correlation matrix
f1=fa(test$observed,scores=TRUE)
round(cor(f1$scores,test$latent),2)  
     #factor score estimates are correlated with but not equal to the factor scores
set.seed(42)
#500 responses to 4 discrete items
items <- sim.congeneric(N=500,short=FALSE,low=-2,high=2,categorical=TRUE) 
d4 <- irt.fa(items$observed)  #item response analysis of congeneric measures






