library(rrcovHD)


### Name: kibler
### Title: 1985 Auto Imports Database
### Aliases: kibler kibler.orig
### Keywords: datasets

### ** Examples

data(kibler)
x.sd <- apply(kibler,2,sd)
xsd <- sweep(kibler, 2, x.sd, "/", check.margin = FALSE)
apply(xsd, 2, sd)

x.mad <- apply(kibler, 2, mad)
xmad <- sweep(kibler, 2, x.mad, "/", check.margin = FALSE)
apply(xmad, 2, mad)

x.qn <- apply(kibler, 2, Qn)
xqn <- sweep(kibler, 2, x.qn, "/", check.margin = FALSE)
apply(xqn, 2, Qn)


## Display the scree plot of the classical and robust PCA
screeplot(PcaClassic(xsd))
screeplot(PcaGrid(xqn))

#########################################
##
## DD-plots
##
## Not run: 
##D usr <- par(mfrow=c(2,2))
##D plot(SPcaGrid(xsd, lambda=0, method="sd", k=4), main="Standard PCA")    # standard
##D plot(SPcaGrid(xqn, lambda=0, method="Qn", k=4))                         # robust, non-sparse
##D 
##D plot(SPcaGrid(xqn, lambda=1,43, method="sd", k=4), main="Stdandard sparse PCA")  # sparse
##D plot(SPcaGrid(xqn, lambda=2.36, method="Qn", k=4), main="Robust sparse PCA")     # robust sparse
##D par(usr)
##D 
##D #########################################
##D ##  Table 2 in Croux et al
##D ##  - to compute EV=Explained variance and Cumulative EV we
##D ##      need to get all 14 eigenvalues
##D ##
##D rpca <- SPcaGrid(xqn, lambda=0, k=14)
##D srpca <- SPcaGrid(xqn, lambda=2.36, k=14)
##D tab <- cbind(round(getLoadings(rpca)[,1:4], 2), round(getLoadings(srpca)[,1:4], 2))
##D 
##D vars1 <- getEigenvalues(rpca);  vars1 <- vars1/sum(vars1)
##D vars2 <- getEigenvalues(srpca); vars2 <- vars2/sum(vars2)
##D cvars1 <- cumsum(vars1)
##D cvars2 <- cumsum(vars2)
##D ev <- round(c(vars1[1:4], vars2[1:4]),2)
##D cev <- round(c(cvars1[1:4], cvars2[1:4]),2)
##D rbind(tab, ev, cev)
## End(Not run)




