library(metaforest)


### Name: PartialDependence
### Title: PartialDependence: Partial dependence plots
### Aliases: PartialDependence

### ** Examples

# Partial dependence plot for MetaForest() model:
set.seed(42)
data <- SimulateSMD(k_train = 100, model = es * x[, 1] + es * x[, 2] + es *
                                           x[, 1] * x[, 2])$training
data$X2 <- cut(data$X2, breaks = 2, labels = c("Low", "High"))
mf.random <- MetaForest(formula = yi ~ ., data = data,
                        whichweights = "random", method = "DL",
                        tau2 = 0.2450)
# Examine univariate partial dependence plot for all variables in the model:
PartialDependence(mf.random)
## Not run: 
##D # Examine bivariate partial dependence plot the interaction between X1 and X2:
##D PartialDependence(mf.random, vars = c("X1", "X2"), interaction = TRUE)
##D 
##D # Partial dependence plot for metafor rma() model:
##D dat <- escalc(measure="RR", ai=tpos, bi=tneg, ci=cpos, di=cneg, data=dat.bcg)
##D dat$yi <- as.numeric(dat$yi)
##D dat$alloc <- factor(dat$alloc)
##D dat$ablat_d <- cut(dat$ablat, breaks = 2, labels = c("low", "high"))
##D # Demonstrate partial dependence plot for a bivariate interaction
##D rma.model.int <- rma(yi, vi, mods=cbind(ablat, tpos),
##D                      data=dat, method="REML")
##D PartialDependence(rma.model.int, rawdata = TRUE, pi = .95,
##D                   interaction = TRUE)
##D # Compare partial dependence for metaforest and rma
##D dat2 <- dat
##D dat2[3:7] <- lapply(dat2[3:7],
##D                     function(x){as.numeric(scale(x, scale = FALSE))})
##D mf.model.all <- MetaForest(yi ~ ., dat2[, c(3:11)])
##D rma.model.all <- rma(dat$yi, dat2$vi,
##D                   mods = model.matrix(yi~., dat2[, c(3:10)])[, -1],
##D                   method="REML")
##D PartialDependence(mf.model.all, rawdata = TRUE, pi = .95)
##D PartialDependence(rma.model.all, rawdata = TRUE, pi = .95)
## End(Not run)



