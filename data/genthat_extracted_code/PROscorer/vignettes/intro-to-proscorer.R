## ----eval=FALSE----------------------------------------------------------
#  install.packages("PROscorer")

## ----eval=FALSE, message = FALSE-----------------------------------------
#  library(PROscorer)

## ----eval=FALSE----------------------------------------------------------
#  dat <- PROscorerTools::makeFakeData(n = 20, nitems = 30, values = 1:4, id = TRUE)
#  dat

## ----eval=FALSE----------------------------------------------------------
#  c30scores <- qlq_c30(dat, 'q')
#  c30scores

## ----eval=FALSE----------------------------------------------------------
#  c30scores <- qlq_c30(df = dat, iprefix = 'q')
#  c30scores

## ----eval=FALSE----------------------------------------------------------
#  dat_scored <- data.frame(dat, c30scores)
#  dat_scored

