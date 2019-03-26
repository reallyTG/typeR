library(psych)


### Name: predict.psych
### Title: Prediction function for factor analysis or principal components
### Aliases: predict.psych
### Keywords: multivariate models

### ** Examples

set.seed(42)
x <- sim.item(12,500)
f2 <- fa(x[1:250,],2,scores="regression")  # a two factor solution
p2 <- principal(x[1:250,],2,scores=TRUE)  # a two component solution
round(cor(f2$scores,p2$scores),2)  #correlate the components and factors from the A set
#find the predicted scores (The B set)
pf2 <- predict(f2,x[251:500,],x[1:250,]) 
  #use the original data for standardization values 
pp2 <- predict(p2,x[251:500,],x[1:250,]) 
 #standardized based upon the first set 
round(cor(pf2,pp2),2)   #find the correlations in the B set
#test how well these predicted scores match the factor scores from the second set
fp2 <- fa(x[251:500,],2,scores=TRUE)
round(cor(fp2$scores,pf2),2)

pf2.n <- predict(f2,x[251:500,])  #Standardized based upon the new data set
round(cor(fp2$scores,pf2.n))   
   #predict factors of set two from factors of set 1, factor order is arbitrary


#note that the signs of the factors in the second set are arbitrary



