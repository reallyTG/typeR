library(GiniWegNeg)


### Name: GRSVc
### Title: Generalized RSV (Raffinetti, Siletti and Vernizzi, 2015) curve
###   of maximum inequality for negative attributes
### Aliases: GRSVc

### ** Examples

# generate the vector of attributes with even negative elements
z<-c(-7,-15,11,-10,2,4,40)
# plot the generalized RSV curve of maximum inequality
GRSVc(z,plot=TRUE) 

# generate the vector of attributes with even negative elements
z<-c(10,-25,-12,3,2,-5,45)
# generate the vector of non-unitary weights
w<-c(1.5,2.2,1.9,3.8,4.7,5,2.3)
# plot the generalized RSV curve of maximum inequality
GRSVc(z,w,plot=TRUE) 

data(BI2012)
# define the vector of non-unitary weights
w<-BI2012$weight 

# select the vector of incomes (e.g., the incomes from transfers YTA)
z<-BI2012$YTA
# plot the generalized RSV curve of maximum inequality
GRSVc(z,w,plot=TRUE) 

# select the vector of incomes (e.g., the incomes from financial capital gain YCF)
z<-BI2012$YCF
# plot the generalized RSV curve of maximum inequality
GRSVc(z,w,plot=TRUE) 



