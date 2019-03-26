library("PSCBS")

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
# Load SNP microarray data
# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
data <- PSCBS::exampleData("paired.chr01")


# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
# Paired PSCBS segmentation
# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
# Drop single-locus outliers
dataS <- dropSegmentationOutliers(data)

# Run light-weight tests by default
if (Sys.getenv("_R_CHECK_FULL_") == "") {
  # Use only every 5th data point
  dataS <- dataS[seq(from=1, to=nrow(data), by=5),]
  # Number of segments (for assertion)
  nSegs <- 4L
} else {
  # Full tests
  nSegs <- 11L
}

str(dataS)


## Create multiple chromosomes
data <- list()
for (cc in 1:3) {
  dataS$chromosome <- cc
  data[[cc]] <- dataS
}
data <- Reduce(rbind, data)
str(data)


message("*** segmentByPairedPSCBS() via futures ...")

library("future")
oplan <- plan()

strategies <- c("sequential", "multiprocess")

## Test 'future.BatchJobs' futures?
pkg <- "future.BatchJobs"
if (require(pkg, character.only=TRUE)) {
  strategies <- c(strategies, "batchjobs_local")
}

message("Future strategies to test: ", paste(sQuote(strategies), collapse=", "))

fits <- list()
for (strategy in strategies) {
  message(sprintf("- segmentByPairedPSCBS() using '%s' futures ...", strategy))
  plan(strategy)
  fit <- segmentByPairedPSCBS(data, seed=0xBEEF, verbose=TRUE)
  fits[[strategy]] <- fit
  stopifnot(all.equal(fit, fits[[1]]))
}

message("*** segmentByPairedPSCBS() via futures ... DONE")


message("*** segmentByPairedPSCBS() via futures with known segments ...")
fits <- list()
dataT <- subset(data, chromosome == 1)
gaps <- findLargeGaps(dataT, minLength=2e6)
knownSegments <- gapsToSegments(gaps)

for (strategy in strategies) {
  message(sprintf("- segmentByCBS() w/ known segments using '%s' futures ...", strategy))
  plan(strategy)
  fit <- segmentByPairedPSCBS(dataT, knownSegments=knownSegments, seed=0xBEEF, verbose=TRUE)
  fits[[strategy]] <- fit
  stopifnot(all.equal(fit, fits[[1]]))
}

message("*** segmentByPairedPSCBS() via futures ... DONE")


## Cleanup
plan(oplan)
rm(list=c("fits", "data", "fit"))
