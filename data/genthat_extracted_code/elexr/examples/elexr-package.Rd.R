library(elexr)


### Name: elexr-package
### Title: Load Associated Press Election Results with Elex
### Aliases: elexr elexr-package

### ** Examples

library(elexr)
# Set your actual AP Elections API Key here. The string below is an example
# only and won't work.
Sys.setenv(AP_API_KEY = "AZA0AZ0aZ0ZA0az0AzAZ0AzazAzaZaZAZ")
tryCatch({
    ia_results <- results("02-01-2016")
},
error = function(err) {
    print(err)
})
  



