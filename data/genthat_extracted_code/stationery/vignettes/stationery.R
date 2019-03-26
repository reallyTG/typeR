### R code from vignette source 'stationery.Rnw'
### Encoding: UTF-8

###################################################
### code chunk number 1: stationery.Rnw:93-94
###################################################
if(!dir.exists("tmpout"))dir.create("tmpout", recursive = TRUE)


###################################################
### code chunk number 2: texcopy
###################################################
library(stationery)
## If theme directory does not have required images or TeX files
## we need to retrieve them and put them in "theme" directory. 
logos <- c(logoright = "logo.pdf", 
"addressFooter.tex", "preambleFooter.tex")
getFiles(logos, pkg = "stationery")
texfiles <- c("reportPreambleSweavel.tex", "reportPreambleHeader.tex", "preambleFooter.tex", "addressFooter.tex", "R.bib")
getFiles(texfiles, pkg = "stationery")


###################################################
### code chunk number 3: Roptions
###################################################
if(!dir.exists("tmpout"))dir.create("tmpout", recursive = TRUE)
opts.orig <- options()
options(device = pdf)
options(width=160, prompt=" ", continue="  ")
options(useFancyQuotes = FALSE) 
set.seed(12345)
par.orig <- par(no.readonly=TRUE) 
pjmar <- c(5.1, 5.1, 1.5, 2.1) 
options(SweaveHooks=list(fig=function() par(mar=pjmar, ps=10)))


###################################################
### code chunk number 4: usage110 (eval = FALSE)
###################################################
## rmd2pdf(c("crmda1.Rmd", "crmda2.Rmd", "crmda3.Rmd"), toc = TRUE, toc_depth = 1)


###################################################
### code chunk number 5: stationery.Rnw:832-833 (eval = FALSE)
###################################################
## rmd2html("crmda.Rmd", theme=NULL)


###################################################
### code chunk number 6: stationery.Rnw:857-858 (eval = FALSE)
###################################################
## rmd2html("crmda.Rmd", theme = "spacelab")


###################################################
### code chunk number 7: sessioninfo
###################################################
zz <- "stationery.Rout"
capture.output(sessionInfo(), file = zz, append = FALSE)
if (!is.null(warnings())){
    capture.output(warnings(), file = zz, append =  TRUE)
}


###################################################
### code chunk number 8: RoptionsRestore
###################################################
## Don't delete this. It puts the interactive session options
## back the way they were. If this is compiled within a session
## it is vital to do this.
options(opts.orig)
par(par.orig)


