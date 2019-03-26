library(ChemometricsWithR)


### Name: pick.peaks
### Title: Peak-picking function.
### Aliases: pick.peaks
### Keywords: manip

### ** Examples

if (require("ptw")) {
data(lcms, package = "ptw")
plot(lcms[1,,1], type = "l", xlim = c(1000, 1500))
abline(v = pick.peaks(lcms[1,,1], 20), col = "blue")
} else {
  cat("Package ptw not available.\nInstall it by typing 'install.packages(\"ptw\")'")
}



