## ---- eval=FALSE, install------------------------------------------------
#  install.packages("tubern")

## ---- eval=FALSE, install_g----------------------------------------------
#  # install.packages('devtools')
#  devtools::install_github("soodoku/tubern", build_vignettes = TRUE)

## ---- eval=FALSE, loadlib------------------------------------------------
#  library(tubern)

## ---- eval=FALSE, auth---------------------------------------------------
#  yt_oauth("998136489867-5t3tq1g7hbovoj46dreqd6k5kd35ctjn.apps.googleusercontent.com", "MbOSt6cQhhFkwETXKur-L9rN")

## ---- eval=FALSE, prints-------------------------------------------------
#  ## Waiting for authentication in browser...
#  ## Press Esc/Ctrl + C to abort
#  ## Authentication complete.

## ---- eval=FALSE, getstats-----------------------------------------------
#  get_report(ids = "channel==MINE", metrics = "views", start_date = "2010-04-01", end_date ="2017-04-01")

