### R code from vignette source 'An_overview.Rnw'

###################################################
### code chunk number 1: An_overview.Rnw:23-25
###################################################
require("NMOF")
options(continue = "  ", digits = 5, max.print = 10, width = 85)


###################################################
### code chunk number 2: An_overview.Rnw:111-112
###################################################
showExample()


###################################################
### code chunk number 3: An_overview.Rnw:120-121 (eval = FALSE)
###################################################
## vignette(package = "NMOF")  ## display vignette titles


###################################################
### code chunk number 4: An_overview.Rnw:123-125
###################################################
x <- vignette(package = "NMOF")
cat(paste(strwrap(x$results[,"Title"], exdent = 2), collapse = "\n"))


###################################################
### code chunk number 5: An_overview.Rnw:143-146 (eval = FALSE)
###################################################
## install.packages("NMOF", type = "source",
##                  repos = c("http://enricoschumann.net/R", 
##                            getOption("repos")))


###################################################
### code chunk number 6: An_overview.Rnw:161-162 (eval = FALSE)
###################################################
## file.show(system.file("NMOFex/NMOFman.R", package = "NMOF"))


###################################################
### code chunk number 7: An_overview.Rnw:169-176
###################################################
test.rep <- readLines(system.file("unitTests/test_results.txt", 
                                  package = "NMOF"))
nt <- gsub(".*\\(([0-9]+) checks?\\).*", "\\1",
           test.rep[grep("\\(\\d+ checks?\\)", test.rep)])
cat("Package version  ", gsub("(.*)[.]([0-9]+)$", "\\1-\\2",
                            packageVersion("NMOF")), "\n",
    "Number of tests: ", sum(as.numeric(nt)), sep = "")


###################################################
### code chunk number 8: An_overview.Rnw:208-211 (eval = FALSE)
###################################################
## require("utils")
## bug.report("[NMOF] Unexpected behaviour in function XXX", 
##             maintainer("NMOF"), package = "NMOF")


