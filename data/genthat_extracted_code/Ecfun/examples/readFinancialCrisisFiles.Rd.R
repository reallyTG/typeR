library(Ecfun)


### Name: readFinancialCrisisFiles
### Title: banking crisis data and function to read financial crisis files
### Aliases: readFinancialCrisisFiles
### Keywords: datasets IO

### ** Examples

##
## Recreate / update the data object BankingCrises
##
library(Ecdat)
## Not run: 
##D bankingCrises <- readFinancialCrisisFiles(FinancialCrisisFiles)
## End(Not run)

##
## Toy example using local data to check the code
## and illustrate returning all the data not just one crisisType
##
Ecdat.demoFiles <- system.file('demoFiles', package='Ecdat')
Ecdat.xls <- dir(Ecdat.demoFiles, pattern='xls$',
                 full.names=TRUE)
if(require(gdata)){
  tst <- financialCrisisFiles(Ecdat.xls)

# optional tests if not CRAN   
  if(!fda::CRAN()){
  bankingCrises.tst <- readFinancialCrisisFiles(tst)
  allCrises.tst <- readFinancialCrisisFiles(tst, 1:8)

# Manually construct tst from allCrises.tst
  tst2 <- data.frame(year=1800:1999)
  tst2$Algeria <- as.numeric(allCrises.tst$Algeria[-(1:12), 8])
  tst2$CentralAfricanRep <- as.numeric(
                    allCrises.tst$CentralAfricanRep[-(1:12), 8])
  tst2$Taiwan <- as.numeric(allCrises.tst$Taiwan[-(1:11), 8])
  tst2$UK <- as.numeric(allCrises.tst$UK[-(1:11), 8])

## Don't show: 
stopifnot(
## End(Don't show)
all.equal(bankingCrises.tst, tst2)
## Don't show: 
)
## End(Don't show)

# check
data(bankingCrises)
## Don't show: 
stopifnot(
## End(Don't show)
all.equal(bankingCrises.tst,
   bankingCrises[1:200, c('year', 'Algeria', 'CentralAfricanRep',
                           'Taiwan', 'UK')])
## Don't show: 
)
## End(Don't show)
}
}



