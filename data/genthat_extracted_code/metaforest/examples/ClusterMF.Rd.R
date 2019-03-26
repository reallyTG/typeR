library(metaforest)


### Name: ClusterMF
### Title: Clustered MetaForest analysis for dependent data.
### Aliases: ClusterMF

### ** Examples

#Load and clean data from metafor
data <- get(data(dat.bourassa1996))
data <- escalc(measure = "OR", ai = lh.le, bi = lh.re, ci = rh.le, di= rh.re,
               data = data, add = 1/2, to = "all")
data$mage[is.na(data$mage)] <- median(data$mage, na.rm = TRUE)
data[c(5:8)] <- lapply(data[c(5:8)], factor)
data$yi <- as.numeric(data$yi)
mf.cluster.b1996 <- ClusterMF(formula = yi~ selection + investigator +
                              hand_assess + eye_assess + mage +sex,
                              data, study = "sample",
                              whichweights = "unif", num.trees = 300)
#Print MetaForest object
mf.cluster.b1996
#Check convergence plot
plot(mf.cluster.b1996)
#Check summary
summary(mf.cluster.b1996, digits = 4)
#Check variable importance plot
VarImpPlot(mf.cluster.b1996)
#Univariate partial dependence plot
PartialDependence(mf.cluster.b1996, vars = "eye_assess")
#Interpolated partial dependence plot for a bivariate interaction
## No test: 
PartialDependence(mf.cluster.b1996, vars = c("mage", "eye_assess"), interaction = TRUE)
## End(No test)



