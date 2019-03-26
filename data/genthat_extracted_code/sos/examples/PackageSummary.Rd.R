library(sos)


### Name: PackageSummary
### Title: Summarize findFn Results by Package
### Aliases: PackageSummary
### Keywords: misc

### ** Examples

tstdf <- data.frame(Package=letters[c(1,1,2)], Score=2:4,
                    Date=LETTERS[1:3], stringsAsFactors=FALSE)
tstdf$Link <- paste0('http://finzi.psych.upenn.edu/R/library/', 
    tstdf$Package, '/html/', letters[4:6], '.html')
    
tstSum <- PackageSummary(tstdf)
# The answer:
tstSm <- data.frame(Package=letters[1:2], Count=c(a=2, b=1),
    MaxScore=c(3, 4), TotalScore=c(5, 4), 
    Date=LETTERS[c(1, 3)], stringsAsFactors=FALSE)
tstSm$pkgLink <- paste0('http://finzi.psych.upenn.edu/R/library/', 
    tstdf$Package[2:3], '/html/00Index.html')    
row.names(tstSm) <- 1:2
## Don't show: 
stopifnot(
## End(Don't show)
all.equal(tstSum, tstSm)
## Don't show: 
)
## End(Don't show)



