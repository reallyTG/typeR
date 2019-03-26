### R code from vignette source 'Computing_returns.Rnw'

###################################################
### code chunk number 1: Computing_returns.Rnw:25-28
###################################################
options(continue = "  ", digits = 3, width = 62, useFancyQuotes = FALSE)
pv <- packageVersion("PMwR")
pv <- gsub("(.*)[.](.*)", "\\1-\\2", pv)


###################################################
### code chunk number 2: Computing_returns.Rnw:42-44
###################################################
library("PMwR")
library("zoo")


###################################################
### code chunk number 3: Computing_returns.Rnw:49-51
###################################################
library("PMwR")
returns(100:105)


###################################################
### code chunk number 4: Computing_returns.Rnw:64-67
###################################################
library("zoo")
DAX <- zoo(DAX[[1]], as.Date(row.names(DAX)))
REXP <- zoo(REXP[[1]], as.Date(row.names(REXP)))


###################################################
### code chunk number 5: Computing_returns.Rnw:73-74
###################################################
str(DAX)


###################################################
### code chunk number 6: Computing_returns.Rnw:76-77
###################################################
options(width = 70)


###################################################
### code chunk number 7: Computing_returns.Rnw:80-81
###################################################
head(returns(DAX))


###################################################
### code chunk number 8: Computing_returns.Rnw:88-89
###################################################
returns(head(cbind(DAX, REXP), 5))


###################################################
### code chunk number 9: Computing_returns.Rnw:95-99
###################################################
returns(DAX, period = "year")
returns(DAX, period = "month")
returns(DAX, period = "2015")
returns(DAX, period = "annualised")


###################################################
### code chunk number 10: Computing_returns.Rnw:103-105
###################################################
returns(cbind(DAX, REXP), period = "year")
returns(cbind(DAX, REXP), period = "month")


###################################################
### code chunk number 11: Computing_returns.Rnw:113-114
###################################################
range(returns(DAX, period = "month"))


###################################################
### code chunk number 12: Computing_returns.Rnw:122-123
###################################################
toLatex(returns(DAX, period = "month"))


###################################################
### code chunk number 13: Computing_returns.Rnw:129-130 (eval = FALSE)
###################################################
## toLatex(returns(DAX, period = "month"))


###################################################
### code chunk number 14: Computing_returns.Rnw:135-136 (eval = FALSE)
###################################################
## vignette("FinTeX", package = "PMwR" )


