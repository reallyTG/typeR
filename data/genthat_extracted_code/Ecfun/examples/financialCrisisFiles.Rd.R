library(Ecfun)


### Name: financialCrisisFiles
### Title: Files containing financial crisis data
### Aliases: financialCrisisFiles
### Keywords: IO

### ** Examples

Ecdat.demoFiles <- system.file('demoFiles', package='Ecdat')
Ecdat.xls <- dir(Ecdat.demoFiles, pattern='xls$',
                 full.names=TRUE)
if(require(gdata)){
  tst <- financialCrisisFiles(Ecdat.xls)
}
## Not run: 
##D # check
##D \dontshow{stopifnot(}
##D all.equal(tst, data(FinancialCrisisFiles))
##D \dontrun{)}
## End(Not run)



