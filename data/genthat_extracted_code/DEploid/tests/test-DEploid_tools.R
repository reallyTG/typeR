context("DEploid tools")

vcfFileName <- system.file("extdata", "PG0390-C.test.vcf.gz",
                           package = "DEploid")
plafFileName <- system.file("extdata", "labStrains.test.PLAF.txt",
                            package = "DEploid")
panelFileName <- system.file("extdata", "labStrains.test.panel.txt",
                             package = "DEploid")
refFileName <- system.file("extdata", "PG0390-C.test.ref", package = "DEploid")
altFileName <- system.file("extdata", "PG0390-C.test.alt", package = "DEploid")

PG0390CoverageVcf <- extractCoverageFromVcf(vcfFileName)
plaf <- extractPLAF(plafFileName)

PG0390Deconv <- dEploid(paste("-vcf", vcfFileName, "-plaf", plafFileName,
                              "-noPanel"))
prop <- PG0390Deconv$Proportions[dim(PG0390Deconv$Proportions)[1], ]
expWSAF <- t(PG0390Deconv$Haps) %*% prop

test_that("Extracted coverage", {
    PG0390CoverageTxt <- extractCoverageFromTxt(refFileName, altFileName)
    expect_that(PG0390CoverageTxt, is_a("data.frame"))
    expect_that(PG0390CoverageVcf, is_a("data.frame"))
    expect_equal(PG0390CoverageTxt, PG0390CoverageVcf)
})


test_that("Extracted plaf", {
    expect_that(plaf, is_a("numeric"))
})


test_that("computeObsWSAF", {
    expect_equal(computeObsWSAF(0, 0), 0)
    expect_equal(computeObsWSAF(0, 100), 0)
    expect_equal(computeObsWSAF(1, 99), 0.01)
    expect_equal(computeObsWSAF(99, 1), 0.99)
    expect_equal(computeObsWSAF(50, 50), 0.5)
    expect_equal(computeObsWSAF(50, 100), 0.3333333333333)
})


test_that("WSAF Related", {
    obsWSAF <- computeObsWSAF(PG0390CoverageVcf$altCount,
                              PG0390CoverageVcf$refCount)
    potentialOutliers <- c(5, 12, 25, 30, 35, 50)
    expect_that(histWSAF(obsWSAF), is_a("histogram"))
    png("histWSAF.png")
    histWSAF(obsWSAF)
    dev.off()
    expect_that(inherits(plotHistWSAFPlotly(obsWSAF), "plotly"), is_true())
    p <- plotHistWSAFPlotly(obsWSAF)
    if (rmarkdown:::pandoc_available()){
        htmlwidgets::saveWidget(p, file = "histWSAFPlotly.html")
    }

    ####
    expect_null(plotWSAFvsPLAF(plaf, obsWSAF))
    png("WSAFvsPLAF.png")
    plotWSAFvsPLAF(plaf, obsWSAF)
    dev.off()
    expect_null(plotWSAFvsPLAF(plaf, obsWSAF, expWSAF))
    expect_that(inherits(plotWSAFVsPLAFPlotly(plaf, obsWSAF,
                                              PG0390CoverageVcf$refCount,
                                              PG0390CoverageVcf$altCount),
                         "plotly"), is_true())
    p <- plotWSAFVsPLAFPlotly(plaf, obsWSAF,
                              PG0390CoverageVcf$refCount,
                              PG0390CoverageVcf$altCount)
    if (rmarkdown:::pandoc_available()){
        htmlwidgets::saveWidget(p, file = "WSAFvsPLAFPlotly.html")
    }

    ###
    expect_null(plotWSAFvsPLAF(plaf, obsWSAF,
                               potentialOutliers = potentialOutliers))
    png("WSAFvsPLAFOutlier.png")
    plotWSAFvsPLAF(plaf, obsWSAF, potentialOutliers = potentialOutliers)
    dev.off()
    expect_null(plotWSAFvsPLAF(plaf, obsWSAF, expWSAF,
                               potentialOutliers = potentialOutliers))
    expect_that(inherits(plotWSAFVsPLAFPlotly(plaf, obsWSAF,
                                              PG0390CoverageVcf$refCount,
                                              PG0390CoverageVcf$altCount,
                                              potentialOutliers =
                                                  potentialOutliers),
                         "plotly"), is_true())
    p <- plotWSAFVsPLAFPlotly(plaf, obsWSAF,
                              PG0390CoverageVcf$refCount,
                              PG0390CoverageVcf$altCount,
                              potentialOutliers = potentialOutliers)
    if (rmarkdown:::pandoc_available()){
        htmlwidgets::saveWidget(p, file = "WSAFvsPLAFPlotlyOutlier.html")
    }
    ###
    expect_null(plotObsExpWSAF(obsWSAF, expWSAF))
    png("ObsExpWSAF.png")
    plotObsExpWSAF(obsWSAF, expWSAF)
    dev.off()
    expect_that(inherits(plotObsExpWSAFPlotly(obsWSAF, expWSAF),
                         "plotly"), is_true())
    p <- plotObsExpWSAFPlotly(obsWSAF, expWSAF)
    if (rmarkdown:::pandoc_available()){
        htmlwidgets::saveWidget(p, file = "ObsExpWSAFPlotly.html")
    }
})


test_that("plotAltVsRef", {
    expect_null(plotAltVsRef(PG0390CoverageVcf$refCount,
        PG0390CoverageVcf$altCount))
    png("AltVsRef.png")
    plotAltVsRef(PG0390CoverageVcf$refCount, PG0390CoverageVcf$altCount)
    dev.off()
    expect_that(inherits(plotAltVsRefPlotly(PG0390CoverageVcf$refCount,
                                            PG0390CoverageVcf$altCount),
                         "plotly"), is_true())
    p <- plotAltVsRefPlotly(PG0390CoverageVcf$refCount,
                            PG0390CoverageVcf$altCount)
    if (rmarkdown:::pandoc_available()){
        htmlwidgets::saveWidget(p, file = "plotAltVsRefPlotly.html")
    }
})


test_that("plotAltVsRefWithOutliers", {
    potentialOutliers <- c(1, 10, 20, 30, 40)
    expect_null(plotAltVsRef(PG0390CoverageVcf$refCount,
                    PG0390CoverageVcf$altCount,
                    potentialOutliers = potentialOutliers))
    png("AltVsRefOutlier.png")
    plotAltVsRef(PG0390CoverageVcf$refCount, PG0390CoverageVcf$altCount,
                 potentialOutliers = potentialOutliers )
    dev.off()
    expect_that(inherits(plotAltVsRefPlotly(PG0390CoverageVcf$refCount,
                    PG0390CoverageVcf$altCount,
                    potentialOutliers = potentialOutliers),
                         "plotly"), is_true())
    p <- plotAltVsRefPlotly(PG0390CoverageVcf$refCount,
                            PG0390CoverageVcf$altCount,
                            potentialOutliers = potentialOutliers)
    if (rmarkdown:::pandoc_available()){
        htmlwidgets::saveWidget(p, file = "plotAltVsRefPlotlyOutlier.html")
    }
})


test_that("plotProportion", {
    expect_that(plotProportions(PG0390Deconv$Proportions, ""), is_a("numeric"))
})
