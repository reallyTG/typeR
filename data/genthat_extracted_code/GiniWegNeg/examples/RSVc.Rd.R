library(GiniWegNeg)


### Name: RSVc
### Title: Ordinary (empirical) RSV (Raffinetti, Siletti and Vernizzi,
###   2015) curve of maximum inequality for negative attributes
### Aliases: RSVc

### ** Examples

# generate the vector of attributes with even negative elements
z<-c(-8,-11,9,-12,7,6,35)
# plot the ordinary (empirical) RSV curve of maximum inequality
RSVc(z,plot=TRUE) 

# generate the vector of attributes with even negative elements
z<-c(12,-21,-10,6,1,-3,40)
# generate the vector of non-unitary weights
w<-c(1.2,2.3,1.6,3.5,4.7,4,2.2)
# plot the ordinary (empirical) RSV curve of maximum inequality
RSVc(z,w,plot=TRUE) 

data(BI2012)
# define the vector of non-unitary weights
w<-BI2012$weight 

# select the vector of incomes (e.g., the incomes from transfers YTA)
z<-BI2012$YTA
# plot the ordinary (empirical) RSV curve of maximum inequality
RSVc(z,w,plot=TRUE) 

# select the vector of incomes (e.g., the incomes from financial capital gain YCF)
z<-BI2012$YCF
# plot the ordinary (empirical) RSV curve of maximum inequality
RSVc(z,w,plot=TRUE) 



