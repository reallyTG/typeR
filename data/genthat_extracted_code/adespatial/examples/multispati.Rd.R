library(adespatial)


### Name: multispati
### Title: Multivariate spatial analysis
### Aliases: multispati plot.multispati summary.multispati print.multispati
### Keywords: multivariate spatial

### ** Examples



if (require(spdep, quiet = TRUE) & require(ade4, quiet = TRUE)) {
    data(mafragh)
    maf.xy <- mafragh$xy
    maf.flo <- mafragh$flo
    maf.listw <- nb2listw(mafragh$nb)
    if(adegraphicsLoaded()) {
      g1 <- s.label(maf.xy, nb = mafragh$nb, plab.cex = 0.75)
    } else {
      s.label(maf.xy, neig = mafragh$neig, clab = 0.75)
    }
    maf.coa <- dudi.coa(maf.flo,scannf = FALSE)
    maf.coa.ms <- multispati(maf.coa, maf.listw, scannf = FALSE, nfposi = 2, nfnega = 2)
    maf.coa.ms
    
    ### detail eigenvalues components
    fgraph <- function(obj){
      # use multispati summary
      sum.obj <- summary(obj)
      # compute Imin and Imax
      Ibounds <- moran.bounds(eval(as.list(obj$call)$listw))
      Imin <- Ibounds[1]
      Imax <- Ibounds[2]
      I0 <- -1/(nrow(obj$li)-1)
      # create labels
      labels <- lapply(1:length(obj$eig),function(i) bquote(lambda[.(i)]))
      # draw the plot
      xmax <- eval(as.list(obj$call)$dudi)$eig[1]*1.1
      par(las=1)
      var <- sum.obj[,2]
      moran <- sum.obj[,3]
      plot(x=var,y=moran,type='n',xlab='Inertia',ylab="Spatial autocorrelation (I)",
           xlim=c(0,xmax),ylim=c(Imin*1.1,Imax*1.1),yaxt='n')
      text(x=var,y=moran,do.call(expression,labels))
      ytick <- c(I0,round(seq(Imin,Imax,le=5),1))
      ytlab <- as.character(round(seq(Imin,Imax,le=5),1))
      ytlab <- c(as.character(round(I0,1)),as.character(round(Imin,1)),
           ytlab[2:4],as.character(round(Imax,1)))
      axis(side=2,at=ytick,labels=ytlab)
      rect(0,Imin,xmax,Imax,lty=2)
      segments(0,I0,xmax,I0,lty=2)
      abline(v=0)
      title("Spatial and inertia components of the eigenvalues")
    }
    fgraph(maf.coa.ms)
    ## end eigenvalues details


    if(adegraphicsLoaded()) {
      g2 <- s1d.barchart(maf.coa$eig, p1d.hori = FALSE, plot = FALSE)
      g3 <- s1d.barchart(maf.coa.ms$eig, p1d.hori = FALSE, plot = FALSE) 
      g4 <- s.corcircle(maf.coa.ms$as, plot = FALSE)
      G1 <- ADEgS(list(g2, g3, g4), layout = c(1, 3))
    } else {
      par(mfrow = c(1, 3))
      barplot(maf.coa$eig)
      barplot(maf.coa.ms$eig) 
      s.corcircle(maf.coa.ms$as)
      par(mfrow = c(1, 1))
    }
 
 
    if(adegraphicsLoaded()) {
      g5 <- s.value(maf.xy, -maf.coa$li[, 1], plot = FALSE)
      g6 <- s.value(maf.xy, -maf.coa$li[, 2], plot = FALSE)
      g7 <- s.value(maf.xy, maf.coa.ms$li[, 1], plot = FALSE)
      g8 <- s.value(maf.xy, maf.coa.ms$li[, 2], plot = FALSE)
      G2 <- ADEgS(list(g5, g6, g7, g8), layout = c(2, 2))
    } else {
      par(mfrow = c(2, 2))
      s.value(maf.xy, -maf.coa$li[, 1])
      s.value(maf.xy, -maf.coa$li[, 2])
      s.value(maf.xy, maf.coa.ms$li[, 1])
      s.value(maf.xy, maf.coa.ms$li[, 2])
      par(mfrow = c(1, 1))
    }


    w1 <- -maf.coa$li[, 1:2]
    w1m <- apply(w1, 2, lag.listw, x = maf.listw)
    w1.ms <- maf.coa.ms$li[, 1:2]
    w1.msm <- apply(w1.ms, 2, lag.listw, x = maf.listw)
    if(adegraphicsLoaded()) {
      g9 <- s.match(w1, w1m, plab.cex = 0.75, plot = FALSE)
      g10 <- s.match(w1.ms, w1.msm, plab.cex = 0.75, plot = FALSE)
      G3 <- cbindADEg(g9, g10, plot = TRUE)
    } else {
      par(mfrow = c(1,2))
      s.match(w1, w1m, clab = 0.75)
      s.match(w1.ms, w1.msm, clab = 0.75)
      par(mfrow = c(1, 1))
    }

    maf.pca <- dudi.pca(mafragh$env, scannf = FALSE)
    multispati.randtest(maf.pca, maf.listw)
    maf.pca.ms <- multispati(maf.pca, maf.listw, scannf=FALSE)
    plot(maf.pca.ms)
}





