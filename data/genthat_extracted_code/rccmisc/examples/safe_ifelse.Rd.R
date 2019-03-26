library(rccmisc)


### Name: safe_ifelse
### Title: A safe alternative to ifelse
### Aliases: safe_ifelse

### ** Examples

# Test must be TRUE to return 'yes'
safe_ifelse(NA, 1, 2) ## 2
ifelse(NA, 1, 2) ## NA

# Factors are problematic in ifelse
ifelse(TRUE, as.factor("hello"), 2) ## 1
## Not run: 
##D safe_ifelse(TRUE, as.factor("hello"), 2) ## Error
## End(Not run)
safe_ifelse(TRUE, as.factor("hello"), as.factor(2)) ## hello
safe_ifelse(TRUE, as.factor("hello"), as.factor(2), drop.levels = FALSE)





