library(edgar)


### Name: mergeCompustat
### Title: Connect sentiment count of multiple cik's 10-K filing with
###   Compustat data.
### Aliases: mergeCompustat

### ** Examples

## Not run: 
##D 
##D ## User needs to input Compustat data in dataframe format.
##D compustat.data <- read.csv('compustat_data.csv')
##D 
##D ## User can apply any desired user defined dictionary 
##D ## other than default dictionaries from this package.
##D words.list <- scan(system.file('data/negwords.txt', package = 'edgar') 
##D                    , what='character')
##D 
##D ## For single cik
##D res <- mergeCompustat( 2098, 2014, words.list, compustat.data)
##D 
##D ## User can provide list of different CIK's.
##D cik.no <- c(1750,6201,2098)
##D res <- mergeCompustat( cik.no, 2014, words.list, compustat.data)
##D  
## End(Not run)




