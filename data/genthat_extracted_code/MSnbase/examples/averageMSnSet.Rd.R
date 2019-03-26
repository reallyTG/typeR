library(MSnbase)


### Name: averageMSnSet
### Title: Generate an average 'MSnSet'
### Aliases: averageMSnSet

### ** Examples

library("pRolocdata")
## 3 replicates from Tan et al. 2009
data(tan2009r1)
data(tan2009r2)
data(tan2009r3)
x <- MSnSetList(list(tan2009r1, tan2009r2, tan2009r3))
avg <- averageMSnSet(x)
dim(avg)
head(exprs(avg))
head(fData(avg)$nNA)
head(fData(avg)$disp)
## using the standard deviation as measure of dispersion
avg2 <-averageMSnSet(x, disp = sd)
head(fData(avg2)$disp)
## keep only complete observations, i.e proteins 
## that had 0 missing values for all samples
sel <- apply(fData(avg)$nNA, 1 , function(x) all(x == 0))
avg <- avg[sel, ]
disp <- rowMax(fData(avg)$disp)
library("pRoloc")
setStockcol(paste0(getStockcol(), "AA"))
plot2D(avg, cex = 7.7 * disp)
title(main = paste("Dispersion: non-parametric CV",
                   paste(round(range(disp), 3), collapse = " - ")))



