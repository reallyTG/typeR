library(Gifi)


### Name: princals
### Title: Categorical principal component analysis (PRINCALS).
### Aliases: princals
### Keywords: multivariate

### ** Examples

ABC6 <- ABC[,6:11]

## ordinal PCA
fitord <- princals(ABC6)  ## ordinal PCA
fitord
summary(fitord)

plot(fitord, plot.type = "transplot")
plot(fitord, "loadplot", main = "Loadings Plot ABC Data")  ## aspect ratio = 1
plot(fitord, "biplot", labels.scores = TRUE, main = "Biplot ABC Data")
plot(fitord, "screeplot")

## linear restrictions (mimics standard PCA)
abc_knots <- knotsGifi(ABC6, "E")     ## 0 interior knots
fitlin <- princals(ABC6, knots = abc_knots, degrees = 1)  
fitlin 
fitlin$evals
plot(fitlin, plot.type = "transplot")

## compare with standard PCA
ABCnum <- makeNumeric(ABC6)
fitpca <- prcomp(ABCnum, scale = TRUE)
fitpca$sdev^2   

## more complicated specifications
## Not run: 
##D data(epi.bfi, package = "psych")
##D epi6 <- epi.bfi[,1:6]
##D fitepi1 <- princals(epi6, knots = knotsGifi(epi6, "Q"))    ## monotone splines (degree 2)
##D fitepi1
##D plot(fitepi1, "transplot")
##D 
##D ## no interior knots vars 1 and 2; data knots vars 3 and 4; 5 
##D ## interior percentile knots var 5; no interior knots var 6)
##D knotList <- c(knotsGifi(epi6[,1:2], "E"), 
##D               knotsGifi(epi6[,3:4], "D"), 
##D               knotsGifi(epi6[,5], "Q", n = 5),
##D               knotsGifi(epi6[,6], "E"))
##D knotList  
##D ordvec <- c(TRUE, FALSE, TRUE, FALSE, FALSE, TRUE) ## ordinal restrictions
##D degvec <- c(3, -1, 2, 2, 3, 1)                     ## spline degrees (second variable nominal)
##D fitepi2 <- princals(epi6, knots = knotList, ordinal = ordvec, degrees = degvec)
##D fitepi2
##D plot(fitepi2, "transplot")
## End(Not run)




