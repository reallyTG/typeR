library(EpiContactTrace)


### Name: Report
### Title: Generate a contact tracing 'Report'
### Aliases: Report Report-methods Report,ContactTrace-method
###   Report,list-method Report,ContactTrace-method Report,list-method
### Keywords: methods

### ** Examples

## Not run: 
##D 
##D ## Load data
##D data(transfers)
##D 
##D ## Perform contact tracing
##D contactTrace <- Trace(movements=transfers,
##D                       root=2645,
##D                       tEnd='2005-10-31',
##D                       days=90)
##D 
##D ## Generate an html report showing details of the contact tracing for
##D ## root 2646.
##D ## Note: Creates the files 2645.html and 2645.png in the working
##D ## directory.
##D Report(contactTrace)
##D 
##D ## It's possible to generate reports for a list of ContactTrace objects.
##D ## Perform contact tracing for ten of the included herds
##D root <- sort(unique(c(transfers$source, transfers$destination)))[1:10]
##D 
##D ## Perform contact tracing
##D contactTrace <- Trace(movements=transfers,
##D                       root=root,
##D                       tEnd='2005-10-31',
##D                       days=90)
##D 
##D ## Generate reports
##D ## Note: Creates the files 1.html, 2.html, ..., 10.html and
##D ## 1.png, 2.png, ..., 10.png in the working directory
##D Report(contactTrace)
## End(Not run)




