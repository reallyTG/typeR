### R code from vignette source 'Getting-Started-with-the-Rcmdr.Rnw'

###################################################
### code chunk number 1: Getting-Started-with-the-Rcmdr.Rnw:231-238
###################################################
library('Rcmdr')
gm <- function(x) {
  gettext(paste0(x, '...'), domain='R-Rcmdr')
  }
gt <- function(x) {
  gettext(x, domain='R-Rcmdr')
  }


