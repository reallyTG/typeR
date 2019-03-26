library(fcros)


### Name: dataSummary
### Title: Summarization of the detection results for a list of chromosomes
### Aliases: dataSummary

### ** Examples

    # load CGH data and info files
    data(cghData)
    rownames(cghData) <- cghData[,1]
    data(cghInfo)
    noms <- colnames(cghData)
    m <- length(noms)
    samp  <- noms[2:m]

    # associate statistics with probes in the dataset
    af <- pfcoMod(cghData, samp, log2.opt = 0, trim.opt = 0.25)

    chromosomes = c(7:9)
    alpha <- 0.05

    # summarize results for each chromosome
    xinfo2 <- dataSummary(af, cghInfo, chromosomes, alpha)

    # display the number of significant probes for each chromosome
    xinfo2$chrSumm



