library(MixfMRI)


### Name: Generalized Cluster-Based Analysis (CBA) Method
### Title: Generalized Cluster-Based Analysis (CBA) Method
### Aliases: cba.cor cba.cor.2d cba.cor.3d
### Keywords: programming

### ** Examples

### Simulated data
library(MixfMRI, quietly = TRUE)
dim <- c(4, 5, 4, 10)
set.seed(123)
da.ts <- array(rnorm(prod(dim)), dim = dim)
id.class <- suppressWarnings(cba.cor(da.ts))
table(id.class)

fun.tanh <- function(a, B){
  d <- 1 / apply(B, 2, function(b){ dist(rbind(as.vector(a), b)) })
  tanh(d)
}
id.class.tanh <- suppressWarnings(cba.cor(da.ts, fun.sim = fun.tanh))
table(id.class.tanh)

fun.logit <- function(a, B){
  d <- dist(t(cbind(a, B)))[1:ncol(B)]
  (1 / (1 + exp(-d))) * 2 - 1
}
id.class.logit <- suppressWarnings(cba.cor(da.ts, fun.sim = fun.logit))
table(id.class.logit)

## No test: 
  ### Real data
  library(AnalyzeFMRI, quietly = TRUE)
  library(oro.nifti, quietly = TRUE)

  fn <- "pb02_volreg_tlrc.nii"
  da <- readNIfTI(fn)
  da.ts <- da@.Data

  fn <- "mask_anat.nii"
  da <- readNIfTI(fn)
  da.m <- da@.Data

  id.class <- suppressWarnings(cba.cor(da.ts, da.m))
  dim(id.class) <- dim(da.m)
  length(table(id.class))
## End(No test)



