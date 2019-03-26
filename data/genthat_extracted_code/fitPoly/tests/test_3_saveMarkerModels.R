context("tests of function saveMarkerModels")

# setwd("tests/testthat") # for testing interactively
# library(foreach)
# load("../../data/fitPoly_data.RData")

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
  stop("Start of test3_saveMarkerModels: cannot cleanup or create outdir")

data(fitPoly_data)

test_that("6x - single and multiple populations", {
  #loadvars <- load("../testdata/6x.RData")
  #expect_equal(loadvars, c("dat6x", "pop6x", "pop.par6x",
  #                         "parPriors6x", "sampPriors6x", "startmeans6x"))
  #without population structures:
  pref <- paste(outdir,"/sMM6xa", sep="")
  saveMarkerModels(ploidy=6, data=fitPoly_data$ploidy6$dat6x,
                   filePrefix=pref,
                   allModelsFile=TRUE,
                   plot="fitted", ncores=2)
  expect_equal(length(dir(outdir)), 5)
  plotdir <- paste(pref, "_plots", sep="")
  expect_true(dir.exists(plotdir))
  expect_equal(length(dir(plotdir)), 6)
  expect_equal(length(dir(plotdir, pattern="rejected*")), 2)
  log <- readLines(paste(pref, ".log", sep=""))
  expect_equal(length(log), 45)
  scores <- read.table(paste(pref, "_scores.dat", sep=""),
                       header=TRUE, sep="\t")
  expect_equal(nrow(scores), 3924)
  expect_equal(ncol(scores), 14)
  models <- read.table(paste(pref, "_models.dat", sep=""),
                       header=TRUE, sep="\t")
  expect_equal(nrow(models), 6)
  expect_equal(ncol(models), 77)
  allmodels <- read.table(paste(pref, "_allmodels.dat", sep=""),
                       header=TRUE, sep="\t")
  expect_equal(nrow(allmodels), 144)
  expect_equal(ncol(allmodels), 77)

  #with population structures
  expect_true(cleanup(outdir, create=TRUE))
  pref <- paste(outdir,"/sMM6xb", sep="")
  saveMarkerModels(ploidy=6, data=fitPoly_data$ploidy6$dat6x,
                   population=fitPoly_data$ploidy6$pop6x,
                   pop.parents=fitPoly_data$ploidy6$pop.par6x,
                   filePrefix=pref,
                   plot="fitted", ncores=2)
  expect_equal(length(dir(outdir)), 4)
  plotdir <- paste(pref, "_plots", sep="")
  expect_true(dir.exists(plotdir))
  expect_equal(length(dir(plotdir)), 6)
  expect_equal(length(dir(plotdir, pattern="rejected*")), 2)
  log <- readLines(paste(pref, ".log", sep=""))
  expect_equal(length(log), 21)
  scores <- read.table(paste(pref, "_scores.dat", sep=""),
                       header=TRUE, sep="\t")
  expect_equal(nrow(scores), 3924)
  expect_equal(ncol(scores), 14)
  models <- read.table(paste(pref, "_models.dat", sep=""),
                       header=TRUE, sep="\t")
  expect_equal(nrow(models), 6)
  expect_equal(ncol(models), 154)
  expect_equal(mean(models$LL), 997.6707, tolerance=5)

  #without population structure, with startmeans:
  expect_true(cleanup(outdir, create=TRUE))
  pref <- paste(outdir,"/sMM6xc", sep="")
  saveMarkerModels(ploidy=6, data=fitPoly_data$ploidy6$dat6x,
                   startmeans=fitPoly_data$ploidy6$startmeans6x,
                   filePrefix=pref,
                   plot="fitted")
  expect_equal(length(dir(outdir)), 4)
  plotdir <- paste(pref, "_plots", sep="")
  expect_true(dir.exists(plotdir))
  expect_equal(length(dir(plotdir)), 6)
  expect_equal(length(dir(plotdir, pattern="rejected*")), 2)
  models <- read.table(paste(pref, "_models.dat", sep=""),
                       header=TRUE, sep="\t")
  expect_equal(nrow(models), 6)
  expect_equal(ncol(models), 77)
  expect_equal(mean(models$LL), 898.8762, tolerance=5)
})

test_that("4x - single and multiple populations", {
  #loadvars <- load("../testdata/4x.RData")
  #expect_equal(loadvars, c("dat4x", "pop4x", "pop.par4x",
  #                         "parPriors4x", "sampPriors4x"))
  #without population structures, with samplePriors:
  expect_true(cleanup(outdir, create=TRUE))
  pref <- paste(outdir,"/sMM4a", sep="")
  saveMarkerModels(ploidy=4, data=fitPoly_data$ploidy4$dat4x,
                   samplePriors=fitPoly_data$ploidy4$sampPriors4x,
                   filePrefix=pref,
                   allModelsFile=TRUE,
                   plot="fitted", ncores=2)
  expect_equal(length(dir(outdir)), 5)
  plotdir <- paste(pref, "_plots", sep="")
  expect_true(dir.exists(plotdir))
  expect_equal(length(dir(plotdir)), 6)
  expect_equal(length(dir(plotdir, pattern="rejected*")), 2)
  log <- readLines(paste(pref, ".log", sep=""))
  expect_equal(length(log), 45)
  scores <- read.table(paste(pref, "_scores.dat", sep=""),
                       header=TRUE, sep="\t")
  expect_equal(nrow(scores), 2712)
  expect_equal(ncol(scores), 12)
  models <- read.table(paste(pref, "_models.dat", sep=""),
                       header=TRUE, sep="\t")
  expect_equal(nrow(models), 6)
  expect_equal(ncol(models), 61)
  expect_equal(mean(models$LL), 555.3902, tolerance=5)
  allmodels <- read.table(paste(pref, "_allmodels.dat", sep=""),
                          header=TRUE, sep="\t")
  expect_equal(nrow(allmodels), 128)
  expect_equal(ncol(allmodels), 61)

  #with population structures, with parental priors:
  expect_true(cleanup(outdir, create=TRUE))
  pref <- paste(outdir,"/sMM4b", sep="")
  saveMarkerModels(ploidy=4, data=fitPoly_data$ploidy4$dat4x,
                   population=fitPoly_data$ploidy4$pop4x,
                   pop.parents=fitPoly_data$ploidy4$pop.par4x,
                   parentalPriors=fitPoly_data$ploidy4$parPriors4x,
                   filePrefix=pref,
                   plot="fitted", ncores=2)
  expect_equal(length(dir(outdir)), 4)
  plotdir <- paste(pref, "_plots", sep="")
  expect_true(dir.exists(plotdir))
  expect_equal(length(dir(plotdir)), 6)
  expect_equal(length(dir(plotdir, pattern="rejected*")), 2)
  log <- readLines(paste(pref, ".log", sep=""))
  expect_equal(length(log), 21)
  models <- read.table(paste(pref, "_models.dat", sep=""),
                       header=TRUE, sep="\t")
  expect_equal(nrow(models), 6)
  expect_equal(ncol(models), 96)
  expect_equal(mean(models$LL), 623.6954, tolerance=5)
})

test_that("small data, no models fitted", {
  loadvars <- load("../testdata/smalldat.RData")
  expect_equal(loadvars, "smalldat")
  expect_true(cleanup(outdir, create=TRUE))
  pref <- paste(outdir,"/sMM5a", sep="")
  saveMarkerModels(ploidy=4, data=smalldat, filePrefix=pref, ncores=1)
  scores <- read.table(paste(pref, "_scores.dat", sep=""),
                       header=TRUE, sep="\t")
  expect_equal(nrow(scores), 0)
  models <- read.table(paste(pref, "_models.dat", sep=""),
                       header=TRUE, sep="\t")
  expect_equal(nrow(models), 4)
  expect_equal(as.character(models$message),
               rep("rejected: too few observations or invalid input", 4))
  pref <- paste(outdir,"/sMM5b", sep="")
  saveMarkerModels(ploidy=4, data=smalldat, filePrefix=pref, ncores=2)
  scores <- read.table(paste(pref, "_scores.dat", sep=""),
                       header=TRUE, sep="\t")
  expect_equal(nrow(scores), 0)
  models <- read.table(paste(pref, "_models.dat", sep=""),
                       header=TRUE, sep="\t")
  expect_equal(nrow(models), 4)
  expect_equal(as.character(models$message),
               rep("rejected: too few observations or invalid input", 4))
})

if (!cleanup(outdir, create=FALSE))
  stop("End of test3_saveMarkerModels: cannot cleanup or remove outdir")


