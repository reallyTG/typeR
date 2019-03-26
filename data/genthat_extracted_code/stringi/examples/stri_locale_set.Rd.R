library(stringi)


### Name: stri_locale_set
### Title: Set or Get Default Locale in 'stringi'
### Aliases: stri_locale_set stri_locale_get

### ** Examples

## Not run: 
##D oldloc <- stri_locale_set("pt_BR")
##D # ... some locale-dependent operations
##D # ... note that you may always modify a locale per-call
##D # ... changing the default locale is convenient if you perform
##D # ... many operations
##D stri_locale_set(oldloc) # restore the previous default locale
## End(Not run)



