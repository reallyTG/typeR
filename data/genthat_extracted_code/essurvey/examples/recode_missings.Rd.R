library(essurvey)


### Name: recode_missings
### Title: Recode pre-defined missing values as NA
### Aliases: recode_missings recode_numeric_missing recode_strings_missing

### ** Examples

## Not run: 
##D seven <- ess_rounds(7, your_email)
##D 
##D attr(seven$tvtot, "labels")
##D mean(seven$tvtot, na.rm = TRUE)
##D 
##D names(table(seven$lnghom1))
##D # First three are actually missing values
##D 
##D seven_recoded <- recode_missings(seven)
##D 
##D attr(seven_recoded$tvtot, "labels")
##D # All missings have been removed
##D mean(seven_recoded$tvtot, na.rm = TRUE)
##D 
##D names(table(seven_recoded$lnghom1))
##D # All missings have been removed
##D 
##D # If you want to operate on specific variables
##D # you can use other recode_*_missing 
##D 
##D seven$tvtot <- recode_numeric_missing(seven$tvtot)
##D 
##D # Recode only 'Don't know' and 'No answer' to missing
##D seven$tvpol <- recode_numeric_missing(seven$tvpol, c("Don't know", "No answer"))
##D 
##D 
##D # The same can be done with recode_strings_missing
## End(Not run)




