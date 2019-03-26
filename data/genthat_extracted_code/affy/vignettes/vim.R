### R code from vignette source 'vim.Rnw'

###################################################
### code chunk number 1: vim.Rnw:42-43
###################################################
library(affy)


###################################################
### code chunk number 2: <
###################################################
getNrowForCEL <- function() max(getPosXForCEL())
getNcolForCEL <- function() max(getPosYForCEL())


