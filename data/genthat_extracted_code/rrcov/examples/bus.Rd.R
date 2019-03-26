library(rrcov)


### Name: bus
### Title: Automatic vehicle recognition data
### Aliases: bus
### Keywords: datasets

### ** Examples

    ## Reproduce Table 6.3 from Maronna et al. (2006), page 213
    data(bus)
    bus <- as.matrix(bus)
    
    ## calculate MADN for each variable
    xmad <- apply(bus, 2, mad)      
    cat("\nMin, Max of MADN: ", min(xmad), max(xmad), "\n")


    ## MADN vary between 0 (for variable 9) and 34. Therefore exclude 
    ##  variable 9 and divide the remaining variables by their MADNs.
    bus1 <- bus[, -9]
    madbus <- apply(bus1, 2, mad)
    bus2 <- sweep(bus1, 2, madbus, "/", check.margin = FALSE)

    ## Compute classical and robust PCA (Spherical/Locantore, Hubert, MCD and OGK)    
    pca  <- PcaClassic(bus2)
    rpca <- PcaLocantore(bus2)
    pcaHubert <- PcaHubert(bus2, k=17, kmax=17, mcd=FALSE)
    pcamcd <- PcaCov(bus2, cov.control=CovControlMcd())
    pcaogk <- PcaCov(bus2, cov.control=CovControlOgk())

    ev    <- getEigenvalues(pca)
    evrob <- getEigenvalues(rpca)
    evhub <- getEigenvalues(pcaHubert)
    evmcd <- getEigenvalues(pcamcd)
    evogk <- getEigenvalues(pcaogk)

    uvar    <- matrix(nrow=6, ncol=6)
    svar    <- sum(ev)
    svarrob <- sum(evrob)
    svarhub <- sum(evhub)
    svarmcd <- sum(evmcd)
    svarogk <- sum(evogk)
    for(i in 1:6){
        uvar[i,1] <- i
        uvar[i,2] <- round((svar - sum(ev[1:i]))/svar, 3)
        uvar[i,3] <- round((svarrob - sum(evrob[1:i]))/svarrob, 3)
        uvar[i,4] <- round((svarhub - sum(evhub[1:i]))/svarhub, 3)
        uvar[i,5] <- round((svarmcd - sum(evmcd[1:i]))/svarmcd, 3)
        uvar[i,6] <- round((svarogk - sum(evogk[1:i]))/svarogk, 3)
    }
    uvar <- as.data.frame(uvar)
    names(uvar) <- c("q", "Classical","Spherical", "Hubert", "MCD", "OGK")
    cat("\nBus data: proportion of unexplained variability for q components\n")
    print(uvar)
 
    ## Reproduce Table 6.4 from Maronna et al. (2006), page 214
    ##
    ## Compute classical and robust PCA extracting only the first 3 components
    ## and take the squared orthogonal distances to the 3-dimensional hyperplane
    ##
    pca3 <- PcaClassic(bus2, k=3)               # classical
    rpca3 <- PcaLocantore(bus2, k=3)            # spherical (Locantore, 1999)
    hpca3 <- PcaHubert(bus2, k=3)               # Hubert
    dist <- pca3@od^2
    rdist <- rpca3@od^2
    hdist <- hpca3@od^2

    ## calculate the quantiles of the distances to the 3-dimensional hyperplane
    qclass  <- round(quantile(dist, probs = seq(0, 1, 0.1)[-c(1,11)]), 1)
    qspc <- round(quantile(rdist, probs = seq(0, 1, 0.1)[-c(1,11)]), 1)
    qhubert <- round(quantile(hdist, probs = seq(0, 1, 0.1)[-c(1,11)]), 1)
    qq <- cbind(rbind(qclass, qspc, qhubert), round(c(max(dist), max(rdist), max(hdist)), 0))
    colnames(qq)[10] <- "Max"
    rownames(qq) <- c("Classical", "Spherical", "Hubert")
    cat("\nBus data: quantiles of distances to hiperplane\n")
    print(qq)

    ## 
    ## Reproduce Fig 6.1 from Maronna et al. (2006), page 214
    ## 
    cat("\nBus data: Q-Q plot of logs of distances to hyperplane (k=3) 
    \nfrom classical and robust estimates. The line is the identity diagonal\n")
    plot(sort(log(dist)), sort(log(rdist)), xlab="classical", ylab="robust")
    lines(sort(log(dist)), sort(log(dist)))
   
    



