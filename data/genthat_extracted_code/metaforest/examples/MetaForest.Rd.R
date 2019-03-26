library(metaforest)


### Name: MetaForest
### Title: Conduct a MetaForest analysis to explore heterogeneity in
###   meta-analytic data.
### Aliases: MetaForest

### ** Examples

#Example 1:
#Simulate data with a univariate linear model
set.seed(42)
data <- SimulateSMD()
#Conduct unweighted MetaForest analysis
mf.unif <- MetaForest(formula = yi ~ ., data = data$training,
                      whichweights = "unif", method = "DL")
#Print model
mf.unif
#Conduct random-effects weighted MetaForest analysis
mf.random <- MetaForest(formula = yi ~ ., data = data$training,
                        whichweights = "random", method = "DL",
                        tau2 = 0.0116)
#Print summary
summary(mf.random)

#Example 2: Real data from metafor
#Load and clean data
data <- dat.bangertdrowns2004
data[, c(4:12)] <- apply(data[ , c(4:12)], 2, function(x){
  x[is.na(x)] <- median(x, na.rm = TRUE)
  x})
data$subject <- factor(data$subject)
data$yi <- as.numeric(data$yi)
#Conduct MetaForest analysis
mf.bd2004 <- MetaForest(formula = yi~ grade + length + minutes + wic+
                               meta, data, whichweights = "unif")
#Print MetaForest object
mf.bd2004
#Check convergence plot
plot(mf.bd2004)
#Check summary
summary(mf.bd2004, digits = 4)
#Examine variable importance plot
VarImpPlot(mf.bd2004)



