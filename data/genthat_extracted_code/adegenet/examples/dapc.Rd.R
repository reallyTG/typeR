library(adegenet)


### Name: dapc
### Title: Discriminant Analysis of Principal Components (DAPC)
### Aliases: dapc dapc.data.frame dapc.matrix dapc.genind dapc.dudi
###   dapc.genlight print.dapc summary.dapc predict.dapc as.lda as.lda.dapc
### Keywords: multivariate

### ** Examples

## data(dapcIllus), data(eHGDP), and data(H3N2) illustrate the dapc
## see ?dapcIllus, ?eHGDP, ?H3N2
##
## Not run: 
##D example(dapcIllus)
##D example(eHGDP)
##D example(H3N2)
## End(Not run)

## H3N2 EXAMPLE ##
data(H3N2)
pop(H3N2) <- factor(H3N2$other$epid)
dapc1 <- dapc(H3N2, var.contrib=FALSE, scale=FALSE, n.pca=150, n.da=5)

## remove internal segments and ellipses, different pch, add MStree
scatter(dapc1, cell=0, pch=18:23, cstar=0, mstree=TRUE, lwd=2, lty=2)

## label individuals at the periphery
# air = 2 is a measure of how much space each label needs
# pch = NA suppresses plotting of points
scatter(dapc1, label.inds = list(air = 2, pch = NA))

## only ellipse, custom labels
scatter(dapc1, cell=2, pch="", cstar=0, posi.da="top",
        label=paste("year\n",2001:2006), axesel=FALSE, col=terrain.colors(10))


## SHOW COMPOPLOT ON MICROBOV DATA ##
data(microbov)
dapc1 <- dapc(microbov, n.pca=20, n.da=15)
compoplot(dapc1, lab="")




## Not run: 
##D ## EXAMPLE USING GENLIGHT OBJECTS ##
##D ## simulate data
##D x <- glSim(50,4e3-50, 50, ploidy=2)
##D x
##D plot(x)
##D 
##D ## perform DAPC
##D dapc1 <- dapc(x, n.pca=10, n.da=1)
##D dapc1
##D 
##D ## plot results
##D scatter(dapc1, scree.da=FALSE)
##D 
##D ## SNP contributions
##D loadingplot(dapc1$var.contr)
##D loadingplot(tail(dapc1$var.contr, 100), main="Loading plot - last 100 SNPs")
##D 
##D 
##D 
##D ## USE "PREDICT" TO PREDICT GROUPS OF NEW INDIVIDUALS ##
##D ## load data
##D data(sim2pop)
##D 
##D ## we make a dataset of:
##D ## 30 individuals from pop A
##D ## 30 individuals from pop B
##D ## 30 hybrids
##D 
##D ## separate populations and make F1
##D temp <- seppop(sim2pop)
##D temp <- lapply(temp, function(e) hybridize(e,e,n=30)) # force equal popsizes
##D 
##D ## make hybrids
##D hyb <- hybridize(temp[[1]], temp[[2]], n=30)
##D 
##D ## repool data - needed to ensure allele matching
##D newdat <- repool(temp[[1]], temp[[2]], hyb)
##D pop(newdat) <- rep(c("pop A", "popB", "hyb AB"), c(30,30,30))
##D 
##D ## perform the DAPC on the first 2 pop (60 first indiv)
##D dapc1 <- dapc(newdat[1:60],n.pca=5,n.da=1)
##D 
##D ## plot results
##D scatter(dapc1, scree.da=FALSE)
##D 
##D ## make prediction for the 30 hybrids
##D hyb.pred <- predict(dapc1, newdat[61:90])
##D hyb.pred
##D 
##D ## plot the inferred coordinates (circles are hybrids)
##D points(hyb.pred$ind.scores, rep(.1, 30))
##D 
##D ## look at assignment using assignplot
##D assignplot(dapc1, new.pred=hyb.pred)
##D title("30 indiv popA, 30 indiv pop B, 30 hybrids")
##D 
##D ## image using compoplot
##D compoplot(dapc1, new.pred=hyb.pred, ncol=2)
##D title("30 indiv popA, 30 indiv pop B, 30 hybrids")
##D 
##D ## CROSS-VALIDATION ##
##D data(sim2pop)
##D xval <- xvalDapc(sim2pop@tab, pop(sim2pop), n.pca.max=100, n.rep=3)
##D xval
##D boxplot(xval$success~xval$n.pca, xlab="Number of PCA components",
##D ylab="Classification succes", main="DAPC - cross-validation")
##D 
## End(Not run)





