library(DLMtool)


### Name: OMinit
### Title: Initialize Operating Model
### Aliases: OMinit

### ** Examples

## Not run: 
##D # Create an Excel OM template and rmd file called 'myOM.xlsx' and 'myOM.rmd': 
##D OMinit('myOM')
##D 
##D # Create an Excel OM template and text file called 'myOM.rmd' and 'myOM.rmd', using
##D another OM as a template: 
##D OMinit('myOM', myOM)
##D 
##D # Create an Excel OM template and text file called 'myOM.rmd' and 'myOM.rmd', using
##D the Stock object 'Herring' as a template: 
##D OMinit('myOM', Herring)
##D 
##D # Create an Excel OM template and text file called 'myOM.rmd' and 'myOM.rmd', using
##D the Stock object 'Herring', and Obs object 'Generic_obs' as templates: 
##D OMinit('myOM', Herring, Generic_obs)
## End(Not run)




