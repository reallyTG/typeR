library(psych)


### Name: irt.fa
### Title: Item Response Analysis by Exploratory Factor Analysis of
###   tetrachoric/polychoric correlations
### Aliases: irt.fa irt.select fa2irt
### Keywords: multivariate models

### ** Examples

## Not run: 
##D set.seed(17)
##D d9 <- sim.irt(9,1000,-2.5,2.5,mod="normal") #dichotomous items
##D test <- irt.fa(d9$items)
##D test 
##D op <- par(mfrow=c(3,1))
##D plot(test,type="ICC")
##D plot(test,type="IIC")
##D plot(test,type="test")
##D par(op)
##D set.seed(17)
##D items <- sim.congeneric(N=500,short=FALSE,categorical=TRUE) #500 responses to 4 discrete items
##D d4 <- irt.fa(items$observed)  #item response analysis of congeneric measures
##D d4    #show just the irt output
##D d4$fa  #show just the factor analysis output
##D 
##D 
##D op <- par(mfrow=c(2,2))
##D plot(d4,type="ICC")
##D par(op)
##D 
##D 
##D #using the iq data set for an example of real items
##D #first need to convert the responses to tf
##D data(iqitems)
##D iq.keys <- c(4,4,4, 6, 6,3,4,4,  5,2,2,4,  3,2,6,7)
##D 
##D iq.tf <- score.multiple.choice(iq.keys,iqitems,score=FALSE)  #just the responses
##D iq.irt <- irt.fa(iq.tf)
##D print(iq.irt,short=FALSE) #show the IRT as well as factor analysis output
##D p.iq <- plot(iq.irt)  #save the invisible summary table
##D p.iq  #show the summary table of information by ability level
##D #select a subset of these variables
##D small.iq.irt <- irt.select(iq.irt,c(1,5,9,10,11,13))
##D small.irt <- irt.fa(small.iq.irt)
##D plot(small.irt)
##D #find the information for three subset of iq items
##D keys <- make.keys(16,list(all=1:16,some=c(1,5,9,10,11,13),others=c(1:5)))
##D plot(iq.irt,keys=keys)
## End(Not run)
#compare output to the ltm package or Kamata and Bauer   -- these are in logistic units 
ls <- irt.fa(lsat6)
#library(ltm)
# lsat.ltm <- ltm(lsat6~z1)
#  round(coefficients(lsat.ltm)/1.702,3)  #convert to normal (approximation)
#
#   Dffclt Dscrmn
#Q1 -1.974  0.485
#Q2 -0.805  0.425
#Q3 -0.164  0.523
#Q4 -1.096  0.405
#Q5 -1.835  0.386


#Normal results  ("Standardized and Marginal")(from Akihito Kamata )       
#Item       discrim             tau 
#  1       0.4169             -1.5520   
#  2       0.4333             -0.5999 
#  3       0.5373             -0.1512 
#  4       0.4044             -0.7723  
#  5       0.3587             -1.1966
#compare to ls 

  #Normal results  ("Standardized and conditional") (from Akihito Kamata )   
#item            discrim   tau
#  1           0.3848    -1.4325  
#  2           0.3976    -0.5505 
#  3           0.4733    -0.1332 
#  4           0.3749    -0.7159 
#  5           0.3377    -1.1264 
#compare to ls$fa and ls$tau 

#Kamata and Bauer (2008) logistic estimates
#1   0.826    2.773
#2   0.723    0.990
#3   0.891    0.249  
#4   0.688    1.285
#5   0.657    2.053
 
 

 





