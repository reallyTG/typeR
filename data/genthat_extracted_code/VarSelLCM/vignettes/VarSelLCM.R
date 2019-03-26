## ---- comment=""---------------------------------------------------------
library(VarSelLCM)
# Data loading:
# x contains the observed variables
# z the known status (i.e. 1: absence and 2: presence of heart disease)
data(heart)
ztrue <- heart[,"Class"]
x <- heart[,-13]
# Add a missing value artificially (just to show that it works!)
x[1,1] <- NA

## ---- comment=""---------------------------------------------------------
# Cluster analysis without variable selection
res_without <- VarSelCluster(x, gvals = 1:3, vbleSelec = FALSE, crit.varsel = "BIC")

# Cluster analysis with variable selection (with parallelisation)
res_with <- VarSelCluster(x, gvals = 1:3, nbcores = 2, crit.varsel = "BIC")


## ---- comment=""---------------------------------------------------------
BIC(res_without)
BIC(res_with)

## ---- comment=""---------------------------------------------------------
ARI(ztrue, fitted(res_without))
ARI(ztrue, fitted(res_with))

## ---- comment=""---------------------------------------------------------
# Estimated partition
fitted(res_with)

# Estimated probabilities of classification
head(fitted(res_with, type="probability"))

## ---- comment=""---------------------------------------------------------
# Summary of the best model
summary(res_with)

## ---- comment=""---------------------------------------------------------
plot(res_with)

## ---- comment=""---------------------------------------------------------
# Boxplot for the continuous variable MaxHeartRate
plot(x=res_with, y="MaxHeartRate")

## ---- comment=""---------------------------------------------------------
# Empirical and theoretical distributions (to check that the distribution is well-fitted)
plot(res_with, y="MaxHeartRate", type="cdf")

## ---- comment=""---------------------------------------------------------
# Summary of categorical variable
plot(res_with, y="Sex")

## ---- comment=""---------------------------------------------------------
# More detailed output
print(res_with)

## ---- comment=""---------------------------------------------------------
# Print model parameter
coef(res_with)

## ---- comment=""---------------------------------------------------------
# Probabilities of classification for new observations 
predict(res_with, newdata = x[1:3,])

## ---- comment=""---------------------------------------------------------
# Imputation by posterior mean for the first observation
not.imputed <- x[1,]
imputed <- VarSelImputation(res_with, x[1,], method = "sampling")
rbind(not.imputed, imputed)

## ---- eval=FALSE, comment="", include=TRUE-------------------------------
# Start the shiny application
VarSelShiny(res_with)

