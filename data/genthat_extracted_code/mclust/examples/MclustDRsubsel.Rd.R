library(mclust)


### Name: MclustDRsubsel
### Title: Subset selection for GMMDR directions based on BIC.
### Aliases: MclustDRsubsel print.MclustDRsubsel MclustDRsubsel_classif
###   MclustDRsubsel_cluster MclustDRrecoverdir MclustDRsubsel1cycle
###   print.MclustDRsubsel summary.MclustDRsubsel
### Keywords: multivariate

### ** Examples

## Not run: 
##D # clustering
##D data(crabs, package = "MASS")
##D x <- crabs[,4:8]
##D class <- paste(crabs$sp, crabs$sex, sep = "|")
##D mod <- Mclust(x)
##D table(class, mod$classification)
##D dr <- MclustDR(mod)
##D summary(dr)
##D plot(dr)
##D drs <- MclustDRsubsel(dr)
##D summary(drs)
##D table(class, drs$class)
##D plot(drs, what = "scatterplot")
##D plot(drs, what = "pairs")
##D plot(drs, what = "contour")
##D plot(drs, what = "boundaries")
##D plot(drs, what = "evalues")
##D 
##D # classification
##D data(banknote)
##D da <- MclustDA(banknote[,2:7], banknote$Status)
##D table(banknote$Status, predict(da)$class)
##D dr <- MclustDR(da)
##D summary(dr)
##D drs <- MclustDRsubsel(dr)
##D summary(drs)
##D table(banknote$Status, predict(drs)$class)
##D plot(drs, what = "scatterplot")
##D plot(drs, what = "classification")
##D plot(drs, what = "boundaries")
## End(Not run)



