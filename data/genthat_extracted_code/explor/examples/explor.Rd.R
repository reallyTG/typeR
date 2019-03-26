library(explor)


### Name: explor
### Title: Interface for analysis results exploration
### Aliases: explor explor.CA explor.coa explor.MCA explor.speMCA
###   explor.mca explor.acm explor.PCA explor.princomp explor.prcomp
###   explor.pca

### ** Examples

## Not run: 
##D 
##D require(FactoMineR)
##D 
##D ## FactoMineR::MCA exploration
##D data(hobbies)
##D mca <- MCA(hobbies[1:1000,c(1:8,21:23)], quali.sup = 9:10, 
##D            quanti.sup = 11, ind.sup = 1:100, graph = FALSE)
##D explor(mca)
##D 
##D ## FactoMineR::PCA exploration
##D data(decathlon)
##D d <- decathlon[,1:12]
##D pca <- PCA(d, quanti.sup = 11:12, graph = FALSE)
##D explor(pca)
## End(Not run)
## Not run: 
##D 
##D library(ade4)
##D 
##D data(bordeaux)
##D tab <- bordeaux
##D row_sup <- tab[5,-4]
##D col_sup <- tab[-5,4]
##D coa <- dudi.coa(tab[-5,-4], nf = 5, scannf = FALSE)
##D coa$supr <- suprow(coa, row_sup)$lisup
##D coa$supc <- supcol(coa, col_sup)$cosup
##D explor(coa)
## End(Not run)
## Not run: 
##D 
##D library(ade4)
##D data(banque)
##D d <- banque[-(1:100),-(19:21)]
##D ind_sup <- banque[1:100, -(19:21)]
##D var_sup <- banque[-(1:100),19:21]
##D acm <- dudi.acm(d, scannf = FALSE, nf = 5)
##D acm$supv <- supcol(acm, dudi.acm(var_sup, scannf = FALSE, nf = 5)$tab)$cosup
##D colw <- acm$cw*ncol(d)
##D X <- acm.disjonctif(ind_sup)
##D X <- data.frame(t(t(X)/colw) - 1)
##D acm$supi <- suprow(acm, X)$lisup
##D explor(acm)
## End(Not run)
## Not run: 
##D 
##D library(ade4)
##D data(deug)
##D d <- deug$tab
##D sup_var <- d[-(1:10), 8:9]
##D sup_ind <- d[1:10, -(8:9)]
##D pca <- dudi.pca(d[-(1:10), -(8:9)], scale = TRUE, scannf = FALSE, nf = 5)
##D supi <- suprow(pca, sup_ind)
##D pca$supi <- supi$lisup
##D supv <- supcol(pca, dudi.pca(sup_var, scale = TRUE, scannf = FALSE)$tab)
##D pca$supv <- supv$cosup
##D explor(pca)
## End(Not run)



