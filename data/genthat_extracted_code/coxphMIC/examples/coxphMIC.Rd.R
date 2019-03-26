library(coxphMIC)


### Name: coxphMIC
### Title: Sparse Estimation for a Cox PH model via Approximated
###   Information Criterion
### Aliases: coxphMIC coxph.MIC

### ** Examples

  # PREPARE THE PBC DATA
  library(survival); data(pbc);
  dat <- pbc; dim(dat);
  dat$status <- ifelse(pbc$status==2, 1, 0)
  # HANDLE CATEGORICAL VARIABLES
  dat$sex <- ifelse(pbc$sex=="f", 1, 0)
  # LISTWISE DELETION USED TO HANDLE MISSING VALUES
  dat <- stats::na.omit(dat);
  dim(dat); utils::head(dat)

  fit.mic <- coxphMIC(formula=Surv(time, status)~.-id, data=dat, method="BIC", scale.x=TRUE)
  names(fit.mic)
  print(fit.mic)
  plot(fit.mic)



