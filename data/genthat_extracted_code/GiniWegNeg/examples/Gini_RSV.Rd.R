library(GiniWegNeg)


### Name: Gini_RSV
### Title: The Gini coefficient adjusted for negative attributes
###   (Raffinetti, Siletti and Vernizzi, 2015)
### Aliases: Gini_RSV

### ** Examples

# generate the vector of attributes with even negative elements
y<-c(-7,-15,11,-10,2,4,40)
# generate the vector of weights
w<-c(2.5,1.1,3.6,4.4,0.8,2.7,1.9)
# compute the Gini coefficient adjusted for negative values
Gini_RSV(y,w)

data(BI2012)
# define the vector of weights
w<-BI2012$weight 

# select the vector of incomes (e.g., the incomes from transfers YTA)
y<-BI2012$YTA
# compute the Gini coefficient adjusted for negative values 
Gini_RSV(y,w)

# select the vector of incomes (e.g., the incomes from financial capital gain YCF)
y<-BI2012$YCF
# compute the Gini coefficient adjusted for negative values 
Gini_RSV(y,w)



