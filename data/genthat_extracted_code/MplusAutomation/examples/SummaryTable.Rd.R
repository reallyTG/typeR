library(MplusAutomation)


### Name: SummaryTable
### Title: Create a summary table of Mplus model statistics
### Aliases: SummaryTable
### Keywords: interface

### ** Examples

## Not run: 
##D  m1 <- mplusObject(TITLE = "Reduced",
##D   MODEL = "mpg ON wt;", rdata = mtcars)
##D  m1.fit <- mplusModeler(m1, "mtcars.dat", run = 1L)
##D  m2 <- mplusObject(TITLE = "Full",
##D   MODEL = "mpg ON wt hp qsec;", rdata = mtcars)
##D  m2.fit <- mplusModeler(m2, "mtcars.dat", run = 1L)
##D 
##D  SummaryTable(list(m1.fit, m2.fit))
##D  SummaryTable(list(m1.fit, m2.fit), type = "popup")
##D  SummaryTable(list(m1.fit, m2.fit), type = "markdown",
##D    keepCols = c("Title", "Parameters", "LL", "AIC", "CFI", "SRMR"),
##D    caption = "Table of Model Fit Statistics",
##D    split.tables = 200)
##D 
##D  # remove files
##D  unlink("mtcars.dat")
##D  unlink("mtcars.inp")
##D  unlink("mtcars.out")
##D  unlink("Mplus Run Models.log")
## End(Not run)



