library(assertive.reflection)


### Name: assert_is_comma_for_decimal_point
### Title: What does the current locale specify for the decimal point?
### Aliases: assert_is_comma_for_decimal_point
###   assert_is_period_for_decimal_point is_comma_for_decimal_point
###   is_period_for_decimal_point is_xxx_for_decimal_point

### ** Examples

# Current settings:
is_comma_for_decimal_point()
is_comma_for_decimal_point("money")
# Or equivalently:
is_period_for_decimal_point()
is_period_for_decimal_point("money")
# A useful guess for reading in files:
read_csv <- if(is_comma_for_decimal_point()) read.csv else read.csv2 
## Not run: 
##D # Force locale and test (may require admin rights)
##D current_locale <- sys_get_locale()
##D a_period_locale <- if(is_windows()) 
##D {
##D   "English_United Kingdom.1252"
##D } else if(is_mac()) 
##D {
##D   "en_GB"
##D } else if(is_linux()) 
##D {
##D   "en_GB.utf8"
##D } else 
##D {
##D   "en"
##D }
##D sys_set_locale(LC_ALL = a_period_locale)
##D assert_is_period_for_decimal_point()
##D a_comma_locale <- if(is_windows())
##D {
##D   "French_France.1252"
##D } else if(is_mac()) 
##D {
##D   "fr_FR"
##D } else if(is_linux()) 
##D {
##D   "fr_FR.utf8" 
##D } else 
##D {
##D   "fr"
##D }
##D sys_set_locale(LC_ALL = a_comma_locale)
##D assert_is_comma_for_decimal_point()
##D suppressWarnings(sys_set_locale(l = current_locale))
## End(Not run)



