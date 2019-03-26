library(phyloclim)


### Name: hypothesis.testing
### Title: Niche Equivalency and Background Similarity Test
### Aliases: niche.equivalency.test niche.identity.test identity.test
###   bg.similarity.test print.ntest plot.ntest

### ** Examples

# path to MAXENT
# --------------
maxent.exe <- paste(system.file(package="dismo"), 
"/java/maxent.jar", sep = "")

# a data frame of coordinates where two species 
# have been detected ('presence points') and
# a raster stack of environmental covariables
# --------------------------------------
species <- c("enneaphylla", "laciniata")
data(sites)
samples <- sites[grep(paste(species, collapse = "|"), sites$spec), ]
data.path <- system.file("extdata", package = "phyloclim")
preds <- list.files(path = data.path, pattern = "[.]asc")
preds <- paste(data.path, preds, sep = "/")
preds <- stack(lapply(X = preds, FUN = raster))

# testing against 9 permutations of the data
# -------------------------------------------
reps <- 9

# run hypothesis tests
# --------------------
if (file.exists(maxent.exe)){
  net <- niche.equivalency.test(samples, preds, reps, maxent.exe)
  net; plot(net)
  bst <- bg.similarity.test(samples, preds, reps, app = maxent.exe)
  bst; plot(bst)
} else {
  message("get a copy of MAXENT (see Details)")
}



