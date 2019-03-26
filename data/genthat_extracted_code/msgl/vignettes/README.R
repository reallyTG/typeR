## ---- echo = FALSE-------------------------------------------------------
set.seed(150)
pkg_version <- packageVersion("msgl")

## ----eval = FALSE--------------------------------------------------------
#  install.packages("msgl")

## ----eval = FALSE--------------------------------------------------------
#  # install.packages("devtools")
#  devtools::install_github("nielsrhansen/sglOptim", build_vignettes = TRUE)
#  devtools::install_github("nielsrhansen/msgl", build_vignettes = TRUE)

## ------------------------------------------------------------------------
library(msgl)

# Load some data
data(PrimaryCancers)

# Setup 2 parallel units
cl <- makeCluster(2)
registerDoParallel(cl)

# Do 10-fold cross validation on 100 models with increasing complexity, using the 2 parallel units
fit.cv <- msgl::cv(
  x = x,
  classes = classes,
  alpha = 0.5,
  lambda = 0.5,
  use_parallel = TRUE
)

stopCluster(cl)

# Print information about models
# and cross validation errors
fit.cv

