library(fcros)


### Name: chrPlot
### Title: Plot a chromosome data
### Aliases: chrPlot

### ** Examples

    # load CGH data and info files
    data(cghData)
    rownames(cghData) <- cghData[,1];
    data(cghInfo)
    noms <- colnames(cghData)
    m <- length(noms)
    samp  <- noms[2:m]

    # associate statistics with probes
    af <- fcrosMod(cghData, samp, log2.opt = 0, trim.opt = 0.25)

    chromosomes = c(7:9)
    alpha <- 0.05

    # summarize results for each chromosome
    xinfo2 <- dataSummary(af, cghInfo, chromosomes, alpha)

    # focused on chromosome 7 data
    idx <- which(xinfo2$xinfo.s$Chromosome == "7")
    chrData <- xinfo2$xinfo.s[idx, ]

    # Plot chromosome 7 data
    chrPlot(chrData, thr = alpha)



