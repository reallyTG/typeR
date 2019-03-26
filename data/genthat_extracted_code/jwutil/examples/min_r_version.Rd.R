library(jwutil)


### Name: min_r_version
### Title: Find minimum R version required for package
### Aliases: min_r_version

### ** Examples

base <- c("base", "compiler", "datasets", "grDevices", "graphics",
"grid", "methods", "parallel", "profile", "splines", "stats",
 "stats4", "tcltk", "tools", "translations")

## Not run: 
##D base_reqs <- lapply(base, min_r_version)
##D contrib <- c("KernSmooth", "MASS", "Matrix", "boot",
##D "class", "cluster", "codetools", "foreign", "lattice",
##D  "mgcv", "nlme", "nnet", "rpart", "spatial", "survival")
##D contrib_reqs <- lapply(contrib, min_r_version)
##D min_r_version("icd")
## End(Not run)



