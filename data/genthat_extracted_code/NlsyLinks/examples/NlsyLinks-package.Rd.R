library(NlsyLinks)


### Name: NlsyLinks-package
### Title: Utilities and kinship information for Behavior Genetics and
###   Developmental research using the NLSY.
### Aliases: NlsyLinks NlsyLinks-package
### Keywords: package

### ** Examples


library(NlsyLinks) #Load the package into the current R session.
summary(Links79Pair)  #Summarize the five variables.
hist(Links79Pair$R)  #Display a histogram of the Relatedness values.
table(Links79Pair$R)  #Create a table of the Relatedness values for the whole sample.

## Not run: 
##D # Install/update NlsyLinks with the release version from CRAN.
##D install.packages('NlsyLinks')
##D 
##D # Install/update NlsyLinks with the development version from GitHub
##D #install.packages('devtools') #Uncomment if `devtools` isn't installed already.
##D devtools::install_github('LiveOak/NlsyLinks')
## End(Not run)



