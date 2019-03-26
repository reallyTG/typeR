library(openCR)


### Name: gonodontisCH
### Title: Gonodontis Moths
### Aliases: gonodontisCH
### Keywords: datasets

### ** Examples


summary(gonodontisCH)
m.array(gonodontisCH)

## Not run: 
##D # compare default (CJS) estimates from openCR, MARK
##D 
##D fit <- openCR.fit(gonodontisCH)
##D predict(fit)
##D 
##D if (require(RMark)) {
##D     MarkPath <- 'c:/Mark/'   # customize as needed
##D     if (!all (nchar(Sys.which(c('mark.exe','mark64.exe', 'mark32.exe'))) < 2)) {
##D        mothdf <- RMarkInput(gonodontisCH)
##D        mark(mothdf)
##D        cleanup(ask = FALSE)
##D     } else message ("mark.exe not found")
##D } else message ("RMark not found")
##D 
## End(Not run)




