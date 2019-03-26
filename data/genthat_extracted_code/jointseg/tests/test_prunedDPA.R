context("Segmentation of univariate signals by dynamic programming")

test_that("pDPA and classical DP yield identical results for univariate signals", {
    ## load known real copy number regions
    affyDat <- loadCnRegionData(dataSet="GSE29172", tumorFraction=1)
    
    ## generate a synthetic CN profile
    K <- 4
    len <- 1e3
    sim <- getCopyNumberDataByResampling(len, K, minLength=100, regData=affyDat)
    datS <- sim$profile
    
    ## run pruned DPA segmentation
    resP <- doDynamicProgramming(datS[["c"]], K=2*K)$dpseg
    
    ## run classical DP (slower)
    res <- pruneByDP(datS[["c"]], K=2*K)

    ## breakpoints
    bkpP <- resP$bkp
    bkp <- res$bkpList

    expect_equal(length(bkp), length(bkpP))
    if (length(bkp) == length(bkpP)) {
        for (kk in 1:length(bkp)) {
            expect_equal(bkp[[kk]], bkpP[[kk]])
        }
    }
    
    ## Cost matrix
    expect_equal(res$V, resP$V)
    
    ## Residual squared error
    expect_equal(res$rse, resP$rse)
    
})