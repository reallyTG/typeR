### R code from vignette source 'An_overview_of_PMwR.Rnw'

###################################################
### code chunk number 1: An_overview_of_PMwR.Rnw:25-28
###################################################
options(continue = "  ", digits = 3, width = 60, useFancyQuotes = FALSE)
pv <- packageVersion("PMwR")
pv <- gsub("(.*)[.](.*)", "\\1-\\2", pv)


###################################################
### code chunk number 2: An_overview_of_PMwR.Rnw:42-44
###################################################
require("PMwR")
require("zoo")


###################################################
### code chunk number 3: An_overview_of_PMwR.Rnw:64-68
###################################################
test.rep <- readLines(system.file("unitTests/test_results.txt", 
                                  package = "PMwR"))
nt <- gsub(".*\\(([0-9]+) checks?\\).*", "\\1",
           test.rep[grep("\\(\\d+ checks?\\)", test.rep)])


###################################################
### code chunk number 4: An_overview_of_PMwR.Rnw:94-96 (eval = FALSE)
###################################################
## install.packages('PMwR', 
##                  repos = c('http://enricoschumann.net/R', getOption('repos')))


###################################################
### code chunk number 5: An_overview_of_PMwR.Rnw:132-134 (eval = FALSE)
###################################################
## utils::bug.report("[PMwR] Unexpected behaviour in function <XXX>", 
##                   maintainer("PMwR"), package = "PMwR")


