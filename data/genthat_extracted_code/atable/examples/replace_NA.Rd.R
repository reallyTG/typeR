library(atable)


### Name: replace_NA
### Title: Replaces NA
### Aliases: replace_NA replace_NA.character replace_NA.factor
###   replace_NA.ordered replace_NA.data.frame replace_NA.list
###   replace_NA.default

### ** Examples

Character <- c(NA,letters[1:3], NA)
Factor <- factor(Character)
Ordered <- ordered(Factor)
Numeric <- rep(1, length(Factor))
Factor_without_NA <- factor(letters[1:length(Factor)])

DD <- data.frame(Character, Factor, Ordered,
                Numeric, Factor_without_NA,
                stringsAsFactors = FALSE)
## Not run: 
##D DD2 <- replace_NA(DD, replacement = 'no value')
##D 
##D summary(DD)
##D summary(DD2) # now with 'no value' instead NA in column Character, Factor and Ordered
##D 
##D atable_options(replace_NA_by = 'not measured') # use atable_options to set replacement
##D DD3 <- replace_NA(DD)
##D summary(DD3) # now with 'not measured' instead NA
##D 
##D atable_options_reset() # set 'replace_NA_by' back to default
## End(Not run)



