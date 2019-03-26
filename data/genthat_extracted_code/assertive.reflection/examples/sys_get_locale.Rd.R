library(assertive.reflection)


### Name: sys_get_locale
### Title: Get or set the system locale
### Aliases: sys_get_locale sys_set_locale

### ** Examples

(current_locale <- sys_get_locale())

# Output simplified to character vector
sys_get_locale(simplify = TRUE)
## Not run: 
##D # Not run since it (temporarily) affects system settings
##D english <- if(is_windows()) "English.United_Kingdom" else 
##D   if(is_mac()) "en_GB" else 
##D   if(is_linux()) "en_GB.utf8" else
##D   "en"
##D sys_set_locale(LC_MONETARY = english)
##D sys_get_locale()
##D sys_set_locale(l = current_locale)  #restore everything
## End(Not run)



