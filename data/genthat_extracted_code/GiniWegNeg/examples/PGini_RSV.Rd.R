library(GiniWegNeg)


### Name: PGini_RSV
### Title: The pseudo-Gini (concentration) coefficient adjusted for
###   negative attributes (Raffinetti, Siletti and Vernizzi, 2016)
### Aliases: PGini_RSV

### ** Examples

# generate the vector of total incomes 
y<-c(-7,-15,11,-10,2,4,40)
# generate the vector of one of the income sources composing the total income
s<-c(-3,6,-5,9,5,-1,-15)
# generate the vector of weights
w<-c(2.5,1.1,3.6,4.4,0.8,2.7,1.9)
# compute the pseudo-Gini (concentration) coefficient 
PGini_RSV(y,s,w)

data(BI2012)
# define the vector of weights
w<-BI2012$weight 
# select the vector of the total net income Y
y<-BI2012$Y

# select the vector of the income source (e.g., the incomes from transfers YTA)
s<-BI2012$YTA
# compute the pseudo-Gini (concentration) coefficient  
PGini_RSV(y,s,w)

# select the vector of the income source (e.g., the incomes from financial capital gain YCF)
s<-BI2012$YCF
# compute the pseudo-Gini (concentration) coefficient 
PGini_RSV(y,s,w)



