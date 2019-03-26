library(forcats)


### Name: fct_unique
### Title: Unique values of a factor
### Aliases: fct_unique

### ** Examples

f <- factor(letters[rpois(100, 10)])

unique(f)     # in order of appearance
fct_unique(f) # in order of levels



