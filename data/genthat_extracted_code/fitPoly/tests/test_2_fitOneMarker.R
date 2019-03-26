context("tests of function fitOneMarker")

# setwd("tests/testthat") # for testing interactively

outdir <- "../../../fitPoly_testoutput"
#output directory is sister directory of package directory

cleanup <- function(outdir, create) {
  while (names(dev.cur()) != "null device") suppressWarnings( dev.off() )
  if (dir.exists(outdir)) unlink(outdir, recursive=TRUE) #remove outdir completely
  if (file.exists(outdir)) file.remove(outdir)
  if (file.exists(outdir)) return(FALSE)
  if (create) {
    dir.create(outdir)
    if (!dir.exists(outdir)) return(FALSE)
  }
  TRUE
}

if (!cleanup(outdir, create=TRUE))
  stop("Start of test2_fitOneMarker: cannot cleanup or create outdir")

data(fitPoly_data)

test_that("4x - multiple populations example Gerrit Gort", {
  #without population structure, ploidy=4:
  loadvars <- load("../testdata/SNP5815.RData")
  expect_equal(loadvars, "SNP5815")
  MarkerName <- rep("SNP5815", nrow(SNP5815))
  SampleName <- character(nrow(SNP5815))
  for (pp in unique(SNP5815$pop)) {
    n <- sum(SNP5815$pop == pp)
    SampleName[SNP5815$pop==pp] <- paste(pp, 1:n, sep="_")
  }
  dat <- data.frame(MarkerName=MarkerName, SampleName=SampleName,
                    ratio=SNP5815$ratio)
  fp <- fitOneMarker(ploidy=4, marker="SNP5815", data=dat)
  expect_equal(nrow(fp$allmodeldata), 24)
  failedmodels <- fp$allmodeldata$m[is.na(fp$allmodeldata$LL)]
  expect_equal(failedmodels, c(5, 13, 16, 43, 45, 48))
  expect_equal(fp$modeldata$LL, 2203.933, tolerance=5)
  #with all plots:
  suppressWarnings(unlink(paste(outdir, "*", sep="/")))
  expect_equal(length(dir(outdir)), 0)
  fp <- fitOneMarker(ploidy=4, marker=1, data=dat,
                     plot="all", plot.dir=outdir)
  expect_equal(length(dir(outdir)), 4)
  #with population structure, ploidy=4:
  pop.parents <- data.frame( #not pre-sorted
    popID = c("P2", "X", "F1", "P1"),
    Par1 = c("", "", "P1", ""),
    Par2 = c("", "", "P2", ""),
    stringsAsFactors = TRUE #must be converted to character in fitOneMarker
  )
  population <- data.frame(
    SampleName = dat$SampleName,
    Population = SNP5815[, 2]
  )
  fp <- fitOneMarker(ploidy=4, marker="SNP5815", data=dat,
                     population=population, pop.parents=pop.parents)
  expect_equal(nrow(fp$allmodeldata), 16)
  failedmodels <- fp$allmodeldata$m[is.na(fp$allmodeldata$LL)]
  expect_equal(failedmodels, c(5, 13, 16))
  expect_equal(fp$modeldata$LL, 2274.178, tolerance=5)
  #with population structure, ploidy=4, and all plots:
  unlink(paste(outdir, "*", sep="/"))
  expect_equal(length(dir(outdir)), 0)
  fp <- fitOneMarker(ploidy=4, marker=1, data=dat,
                     population=population, pop.parents=pop.parents,
                     plot="all", plot.dir=outdir)
  expect_equal(length(dir(outdir)), 5)
  expect_equal(fp$scores$geno[substring(fp$scores$SampleName, 1, 1) == "P"],
               c(1, 1, 3, 3)) #correct parental dosages
})

test_that("6x - multiple populations", {
  #loadvars <- load("../testdata/6x.RData")
  #expect_equal(loadvars, c("dat6x", "pop6x", "pop.par6x",
  #                         "parPriors6x", "sampPriors6x", "startmeans6x"))

  #with population structure, ploidy=6:
  unlink(paste(outdir, "*", sep="/"))
  expect_equal(length(dir(outdir)), 0)
  fp <- fitOneMarker(ploidy=6, marker=1, data=fitPoly_data$ploidy6$dat6x,
                     population=fitPoly_data$ploidy6$pop6x,
                     pop.parents=fitPoly_data$ploidy6$pop.par6x,
                     plot="all", plot.dir=outdir)
  expect_equal(length(dir(outdir)), 13)
  expect_equal(nrow(fp$allmodeldata), 24)
  failedmodels <- fp$allmodeldata$m[is.na(fp$allmodeldata$LL)]
  expect_equal(failedmodels, c(13, 14, 16, 41, 43, 45, 46, 47, 48))
  expect_equal(fp$modeldata$LL, 626.3242, tolerance=5)

  #with population structure and startmeans, ploidy=6:
  unlink(paste(outdir, "*", sep="/"))
  expect_equal(length(dir(outdir)), 0)
  fp <- fitOneMarker(ploidy=6, marker=1, data=fitPoly_data$ploidy6$dat6x,
                     population=fitPoly_data$ploidy6$pop6x,
                     pop.parents=fitPoly_data$ploidy6$pop.par6x,
                     startmeans=fitPoly_data$ploidy6$startmeans6x,
                     plot="fitted", plot.dir=outdir)
})

test_that("3x", {
  #loadvars <- load("../testdata/3x.RData")
  #expect_equal(loadvars, c("dat3x", "pop3x", "pop.par3x"))

  #without population structure, ploidy=3:
  fp <- fitOneMarker(ploidy=3, marker="mrk039", data=fitPoly_data$ploidy3$dat3x)
  expect_equal(nrow(fp$allmodeldata), 16)
  expect_equal(length(fp$allmodeldata), 53)
  failedmodels <- fp$allmodeldata$m[is.na(fp$allmodeldata$LL)]
  expect_equal(failedmodels, c(7, 12, 14, 15, 16))
  expect_equal(fp$modeldata$LL, 132.6224, tolerance=5)

  #with population structure, ploidy=3, no F1's, plot fitted:
  #specify as matrix/integer population nr instead of data.frame/ population names:
  nf <- length(dir(outdir))
  pop.parents <- matrix(c(NA,NA,NA,NA), ncol=2, byrow=TRUE) #2 panels
  rownames(pop.parents) <- c("panel1", "panel2")
  pop <- data.frame(
    SampleName = fitPoly_data$ploidy3$dat3x$SampleName[fitPoly_data$ploidy3$dat3x$MarkerName == "mrk039"],
    Population = c(rep(1, 90), rep(2, 62)))
  fp <- fitOneMarker(ploidy=3, marker="mrk039", data=fitPoly_data$ploidy3$dat3x,
                     population=pop, pop.parents=pop.parents,
                     plot="fitted", plot.dir=outdir)
  expect_equal(length(dir(outdir)) - nf, 1)
  expect_equal(nrow(fp$allmodeldata), 16)
  failedmodels <- fp$allmodeldata$m[is.na(fp$allmodeldata$LL)]
  expect_equal(failedmodels, c(7, 14, 15, 16))
  expect_equal(fp$modeldata$LL, 132.624, tolerance=5)
  expect_equal(fp$modeldata$mu0, 0.401, tolerance=1e-3)
  expect_equal(fp$modeldata$mu1, 0.531, tolerance=1e-3)

  #with population structure including F1,
  #not allowed for odd ploidy:
  pop.parents <- matrix(c(2,3,NA,NA,NA,NA), ncol=2, byrow=TRUE)
  rownames(pop.parents) <- c("F1", "P1", "P2")
  pop <- data.frame(
    SampleName = fitPoly_data$ploidy3$dat3x$SampleName[fitPoly_data$ploidy3$dat3x$MarkerName == "mrk039"],
    Population = c(2, 3, 3, rep(1, 149)))
  expect_error(
    fp <- fitOneMarker(ploidy=3, marker="mrk040", data=fitPoly_data$ploidy3$dat3x,
                       population=pop, pop.parents=pop.parents,
                       plot="fitted", plot.dir=outdir),
    "invalid population structure: F1 populations not allowed with odd ploidy"
  )
})

test_that("2x", {
  #loadvars <- load("../testdata/2x.RData")
  #expect_equal(loadvars, "dat2x")

  #without population structure, ploidy=2:
  fp <- fitOneMarker(ploidy=2, marker=1, data=fitPoly_data$ploidy2$dat2x)
  expect_equal(nrow(fp$allmodeldata), 16)
  expect_equal(length(fp$allmodeldata), 45)
  failedmodels <- fp$allmodeldata$m[is.na(fp$allmodeldata$LL)]
  expect_equal(failedmodels, c(3, 4, 7, 8, 11, 12, 15, 16))
  #            all models with nonlinear mu's fail
  expect_equal(fp$modeldata$LL, 213.3432, tolerance=5)
})

test_that("4x - with parental priors", {
  #loadvars <- load("../testdata/4x.RData")
  #expect_equal(loadvars, c("dat4x", "pop4x", "pop.par4x",
  #                         "parPriors4x", "sampPriors4x"))

  #without population structure, ploidy=4:
  unlink(paste(outdir, "*", sep="/"))
  expect_equal(length(dir(outdir)), 0)
  fp <- fitOneMarker(ploidy=4, marker=2, data=fitPoly_data$ploidy4$dat4x,
                     plot="fitted", plot.dir=outdir)
  expect_equal(nrow(fp$allmodeldata), 16)
  failedmodels <- fp$allmodeldata$m[is.na(fp$allmodeldata$LL)]
  expect_equal(failedmodels, c(10, 15, 16))
  expect_equal(fp$modeldata$LL, 467.1877, tolerance=5)

  #with population structure, no parental priors:
  fp <- fitOneMarker(ploidy=4, marker=2, data=fitPoly_data$ploidy4$dat4x,
                     population=fitPoly_data$ploidy4$pop4x,
                     pop.parents=fitPoly_data$ploidy4$pop.par4x,
                     plot="fitted", plot.dir=outdir)
  expect_equal(nrow(fp$allmodeldata), 16)
  failedmodels <- fp$allmodeldata$m[is.na(fp$allmodeldata$LL)]
  expect_equal(failedmodels, c(15, 16))
  expect_equal(fp$modeldata$LL, 590.1281, tolerance=5)

  #with population structure and parental and sample priors:
  unlink(paste(outdir, "*", sep="/"))
  expect_equal(length(dir(outdir)), 0)
  fp <- fitOneMarker(ploidy=4, marker=2, data=fitPoly_data$ploidy4$dat4x,
                     population=fitPoly_data$ploidy4$pop4x,
                     pop.parents=fitPoly_data$ploidy4$pop.par4x,
                     parentalPriors=fitPoly_data$ploidy4$parPriors4x,
                     samplePriors=fitPoly_data$ploidy4$sampPriors4x,
                     plot="all", plot.dir=outdir)
  expect_equal(length(dir(outdir)), 13)
  expect_equal(nrow(fp$allmodeldata), 24)
  failedmodels <- fp$allmodeldata$m[is.na(fp$allmodeldata$LL)]
  expect_equal(failedmodels, c(15, 16))
  expect_equal(fp$modeldata$LL, 590.1281, tolerance=5)
})

if (!cleanup(outdir, create=FALSE))
  stop("End of test2_fitOneMarker: cannot cleanup or remove outdir")

