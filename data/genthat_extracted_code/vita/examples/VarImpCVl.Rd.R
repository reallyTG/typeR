library(vita)


### Name: VarImpCVl
### Title: Fold-specific permutation variable importance measure
### Aliases: VarImpCVl

### ** Examples

##############################
#      Classification        #
##############################
## Simulating data
X = replicate(8,rnorm(100))
X= data.frame( X) #"X" can also be a matrix
z  = with(X,5*X1 + 3*X2 + 2*X3 + 1*X4 -
          5*X5 - 9*X6 - 2*X7 + 1*X8 )
pr = 1/(1+exp(-z))         # pass through an inv-logit function
y = as.factor(rbinom(100,1,pr))

##################################################################
## Split indexes 2- folds
k = 2
cuts = round(length(y)/k)
from = (0:(k-1)*cuts)+1
to = (1:k*cuts)
rs = sample(1:length(y))
l = 1
##################################################################
## Compute fold-specific permutation variable importance
library("randomForest")

lth = rs[from[l]:to[l]]
# without the l-th data set
Xl = X[-lth,]
yl = y[-lth]
cl.rf_l = randomForest(Xl,yl,keep.forest = TRUE)
# the l-th data set
X_l = X[lth,]
y_l = y[lth]
# Compute l-th fold-specific variable importance
cvl_varim=VarImpCVl(X_l,y_l,cl.rf_l)

##############################
#      Regression            #
##############################
##################################################################
## Simulating data:
X = replicate(15,rnorm(120))
X = data.frame( X) #"X" can also be a matrix
y = with(X,2*X1 + 2*X2 + 2*X3 + 1*X4 - 2*X5 - 2*X6 - 1*X7 + 2*X8 )
##################################################################
## Split indexes 2- folds
k = 2
cuts = round(length(y)/k)
from = (0:(k-1)*cuts)+1
to = (1:k*cuts)
rs = sample(1:length(y))
l = 1

##################################################################
## Compute fold-specific permutation variable importance
library("randomForest")

lth = rs[from[l]:to[l]]
# without the l-th data set
Xl = X[-lth,]
yl = y[-lth]
reg.rf_l = randomForest(Xl,yl,keep.forest = TRUE)
# the l-th data set
X_l = X[lth,]
y_l = y[lth]
# Compute l-th fold-specific variable importance
CVVI_l = VarImpCVl(X_l,y_l,reg.rf_l)




