### R code from vignette source 'btable.Rnw'

###################################################
### code chunk number 1: btable.Rnw:24-25
###################################################
options(continue = " ", digits = 3, width = 60, useFancyQuotes = FALSE)


###################################################
### code chunk number 2: btable.Rnw:38-39
###################################################
require("textutils")


###################################################
### code chunk number 3: btable.Rnw:58-60
###################################################
x <- 1:5
cat(btable(x, before = paste(1:5, "&"), after= "\\\\\n"))


###################################################
### code chunk number 4: btable.Rnw:70-71
###################################################
toLatex(sessionInfo())


