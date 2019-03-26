library(ade4)


### Name: multispati
### Title: Multivariate spatial analysis
### Aliases: multispati plot.multispati summary.multispati print.multispati
### Keywords: multivariate spatial

### ** Examples

## Not run: 
##D if (requireNamespace("spdep", quietly = TRUE)) {
##D     data(mafragh)
##D     maf.xy <- mafragh$xy
##D     maf.flo <- mafragh$flo
##D     maf.listw <- spdep::nb2listw(neig2nb(mafragh$neig))
##D     if(adegraphicsLoaded()) {
##D       g1 <- s.label(maf.xy, nb = neig2nb(mafragh$neig), plab.cex = 0.75)
##D     } else {
##D       s.label(maf.xy, neig = mafragh$neig, clab = 0.75)
##D     }
##D     maf.coa <- dudi.coa(maf.flo,scannf = FALSE)
##D     maf.coa.ms <- multispati(maf.coa, maf.listw, scannf = FALSE, nfposi = 2, nfnega = 2)
##D     maf.coa.ms
##D     
##D     ### detail eigenvalues components
##D     fgraph <- function(obj){
##D       # use multispati summary
##D       sum.obj <- summary(obj)
##D       # compute Imin and Imax
##D       L <- spdep::listw2mat(eval(as.list(obj$call)$listw))
##D       Imin <- min(eigen(0.5*(L+t(L)))$values)
##D       Imax <- max(eigen(0.5*(L+t(L)))$values)
##D       I0 <- -1/(nrow(obj$li)-1)
##D       # create labels
##D       labels <- lapply(1:length(obj$eig),function(i) bquote(lambda[.(i)]))
##D       # draw the plot
##D       xmax <- eval(as.list(obj$call)$dudi)$eig[1]*1.1
##D       par(las=1)
##D       var <- sum.obj[,2]
##D       moran <- sum.obj[,3]
##D       plot(x=var,y=moran,type='n',xlab='Inertia',ylab="Spatial autocorrelation (I)",
##D            xlim=c(0,xmax),ylim=c(Imin*1.1,Imax*1.1),yaxt='n')
##D       text(x=var,y=moran,do.call(expression,labels))
##D       ytick <- c(I0,round(seq(Imin,Imax,le=5),1))
##D       ytlab <- as.character(round(seq(Imin,Imax,le=5),1))
##D       ytlab <- c(as.character(round(I0,1)),as.character(round(Imin,1)),
##D            ytlab[2:4],as.character(round(Imax,1)))
##D       axis(side=2,at=ytick,labels=ytlab)
##D       rect(0,Imin,xmax,Imax,lty=2)
##D       segments(0,I0,xmax,I0,lty=2)
##D       abline(v=0)
##D       title("Spatial and inertia components of the eigenvalues")
##D     }
##D     fgraph(maf.coa.ms)
##D     ## end eigenvalues details
##D 
##D 
##D     if(adegraphicsLoaded()) {
##D       g2 <- s1d.barchart(maf.coa$eig, p1d.hori = FALSE, plot = FALSE)
##D       g3 <- s1d.barchart(maf.coa.ms$eig, p1d.hori = FALSE, plot = FALSE) 
##D       g4 <- s.corcircle(maf.coa.ms$as, plot = FALSE)
##D       G1 <- ADEgS(list(g2, g3, g4), layout = c(1, 3))
##D     } else {
##D       par(mfrow = c(1, 3))
##D       barplot(maf.coa$eig)
##D       barplot(maf.coa.ms$eig) 
##D       s.corcircle(maf.coa.ms$as)
##D       par(mfrow = c(1, 1))
##D     }
##D  
##D  
##D     if(adegraphicsLoaded()) {
##D       g5 <- s.value(maf.xy, -maf.coa$li[, 1], plot = FALSE)
##D       g6 <- s.value(maf.xy, -maf.coa$li[, 2], plot = FALSE)
##D       g7 <- s.value(maf.xy, maf.coa.ms$li[, 1], plot = FALSE)
##D       g8 <- s.value(maf.xy, maf.coa.ms$li[, 2], plot = FALSE)
##D       G2 <- ADEgS(list(g5, g6, g7, g8), layout = c(2, 2))
##D     } else {
##D       par(mfrow = c(2, 2))
##D       s.value(maf.xy, -maf.coa$li[, 1])
##D       s.value(maf.xy, -maf.coa$li[, 2])
##D       s.value(maf.xy, maf.coa.ms$li[, 1])
##D       s.value(maf.xy, maf.coa.ms$li[, 2])
##D       par(mfrow = c(1, 1))
##D     }
##D 
##D 
##D     w1 <- -maf.coa$li[, 1:2]
##D     w1m <- apply(w1, 2, spdep::lag.listw, x = maf.listw)
##D     w1.ms <- maf.coa.ms$li[, 1:2]
##D     w1.msm <- apply(w1.ms, 2, spdep::lag.listw, x = maf.listw)
##D     if(adegraphicsLoaded()) {
##D       g9 <- s.match(w1, w1m, plab.cex = 0.75, plot = FALSE)
##D       g10 <- s.match(w1.ms, w1.msm, plab.cex = 0.75, plot = FALSE)
##D       G3 <- cbindADEg(g9, g10, plot = TRUE)
##D     } else {
##D       par(mfrow = c(1,2))
##D       s.match(w1, w1m, clab = 0.75)
##D       s.match(w1.ms, w1.msm, clab = 0.75)
##D       par(mfrow = c(1, 1))
##D     }
##D 
##D     maf.pca <- dudi.pca(mafragh$env, scannf = FALSE)
##D     multispati.randtest(maf.pca, maf.listw)
##D     maf.pca.ms <- multispati(maf.pca, maf.listw, scannf=FALSE)
##D     plot(maf.pca.ms)
##D }
## End(Not run)


