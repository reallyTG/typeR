library(psych)


### Name: cohen.kappa
### Title: Find Cohen's kappa and weighted kappa coefficients for
###   correlation of two raters
### Aliases: wkappa cohen.kappa
### Keywords: multivariate

### ** Examples


#rating data (with thanks to Tim Bates)
rater1 = c(1,2,3,4,5,6,7,8,9) # rater one's ratings
rater2 = c(1,3,1,6,1,5,5,6,7) # rater one's ratings
cohen.kappa(x=cbind(rater1,rater2))

#data matrix taken from Cohen
cohen <- matrix(c(
0.44, 0.07, 0.09,
0.05, 0.20, 0.05,
0.01, 0.03, 0.06),ncol=3,byrow=TRUE)

#cohen.weights  weight differences
cohen.weights <- matrix(c(
0,1,3,
1,0,6,
3,6,0),ncol=3)


cohen.kappa(cohen,cohen.weights,n.obs=200)
#cohen reports .492 and .348 

#another set of weights
#what if the weights are non-symmetric
wc <- matrix(c(
0,1,4,
1,0,6,
2,2,0),ncol=3,byrow=TRUE)
cohen.kappa(cohen,wc)  
#Cohen reports kw = .353

cohen.kappa(cohen,n.obs=200)  #this uses the squared weights

fleiss.cohen <- 1 - cohen.weights/9
cohen.kappa(cohen,fleiss.cohen,n.obs=200)

#however, Fleiss, Cohen and Everitt weight similarities
fleiss <- matrix(c(
106, 10,4,
22,28, 10,
2, 12,  6),ncol=3,byrow=TRUE)

#Fleiss weights the similarities
weights <- matrix(c(
 1.0000, 0.0000, 0.4444,
 0.0000, 1.0000, 0.6667,
 0.4444, 0.6667, 1.0000),ncol=3)
 
 cohen.kappa(fleiss,weights,n.obs=200)
 
 #another example is comparing the scores of two sets of twins
 #data may be a 2 column matrix
 #compare weighted and unweighted
 #also look at the ICC for this data set.
 twins <- matrix(c(
    1, 2, 
    2, 3,
    3, 4,
    5, 6,
    6, 7), ncol=2,byrow=TRUE)
  cohen.kappa(twins)
  
#data may be explicitly categorical
x <- c("red","yellow","blue","red")
y <- c("red",  "blue", "blue" ,"red") 
xy.df <- data.frame(x,y)
ck <- cohen.kappa(xy.df)
ck
ck$agree

#Example for specifying levels
#The problem of missing categories (from Amy Finnegan)
#We need to specify all the categories possible using the levels option
numbers <- data.frame(rater1=c(6,3,7,8,7),
                      rater2=c(6,1,8,5,10))
cohen.kappa(numbers)  #compare with the next analysis
cohen.kappa(numbers,levels=1:10)  #specify the number of levels 
              #   these leads to slightly higher weighted kappa
  
#finally, input can be a data.frame of ratings from more than two raters
ratings <- matrix(rep(1:5,4),ncol=4)
ratings[1,2] <- ratings[2,3] <- ratings[3,4] <- NA
ratings[2,1] <- ratings[3,2] <- ratings[4,3] <- 1
ck <- cohen.kappa(ratings)
ck  #just show the raw and weighted kappas
print(ck, all=TRUE)  #show the confidence intervals as well

 
 #In the case of confidence intervals being artificially truncated to +/- 1, it is 
 #helpful to compare the results of a boot strap resample
 #ck.boot <-function(x,s=1:nrow(x)) {cohen.kappa(x[s,])$kappa}
 #library(boot)
 #ckb <- boot(x,ck.boot,R=1000)
 #hist(ckb$t)
 



