library(protViz)


### Name: PTM_MarkerFinder
### Title: PTM MarkerFinder
### Aliases: PTM_MarkerFinder pPTM findMz findMz.mascot findMz.psmSet

### ** Examples


    # some marker ions
    
    Glykan_MarkerIons <- c(109.02841, 127.03897, 145.04954, 163.06010, 325.11292)
    
    HexNAc_MarkerIons <- c(126.05495, 138.05495, 144.06552, 168.06552, 186.07608, 204.08665)

    # DOI: 10.1021/acs.analchem.6b03365
    # Anal Chem 2017 Feb 13;89(3):1523-1530. Epub 2017 Jan 13.
    ADP_Ribose <- c(136.0618, 250.0935, 348.0704, 428.0367)
    
    data(HexNAc)

    # prepare modification
    ptm.0 <- cbind(AA="-",
        mono=0.0, avg=0.0, desc="unmodified", unimodAccID=NA)
      
    ptm.1 <- cbind(AA='N', 
          mono=317.122300, avg=NA, desc="HexNAc",
                  unimodAccID=2)
        
    ptm.2 <- cbind(AA='M',
            mono=147.035400, avg=NA, desc="Oxidation",
                    unimodAccID=1)

    m <- as.data.frame(rbind(ptm.0, ptm.1, ptm.2))

    s <- PTM_MarkerFinder(data=HexNAc, modification=m$mono, 
        modificationName=m$desc,
        minMarkerIntensityRatio=3,
        itol_ppm=20,
        mZmarkerIons=HexNAc_MarkerIons) 


    boxplot(s$markerIonIntensity ~ s$markerIonMZ,
        log='y',
        main='Summary plot: boxplot of marker ion intensities from all pPTM spectra',
        xlab='markerIon m/z', 
        ylab='log10 based marker ion intensity')

    # export
    w <- reshape(s[,c(1,7,3,4)], direction='wide', 
        timevar="markerIonMZ", idvar=c('scans','query'))

    write.table(w, file="HexNAc_PTM_markerFinder.csv",
        sep=',', row.names=FALSE,col.names=TRUE, quote=FALSE)



