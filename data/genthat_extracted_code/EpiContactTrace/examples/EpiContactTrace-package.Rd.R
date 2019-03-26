library(EpiContactTrace)


### Name: EpiContactTrace-package
### Title: Epidemiological tool for contact tracing.
### Aliases: EpiContactTrace-package EpiContactTrace
### Keywords: package

### ** Examples


## Load data
data(transfers)

## Perform contact tracing
contactTrace <- Trace(movements=transfers,
                      root=2645,
                      tEnd='2005-10-31',
                      days=90)

show(contactTrace)

## Not run: 
##D ## Generate an html report showing details of the contact tracing for
##D ## root 2645.
##D ## Note: Creates the files 2645.html and 2645.png in the working
##D ## directory.
##D Report(contactTrace)
## End(Not run)




