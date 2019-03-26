library(numform)


### Name: f_affix
### Title: Add String Affixes
### Aliases: f_affix ff_affix f_prefix ff_prefix f_suffix ff_suffix

### ** Examples

f_affix(1:5, "-", "%")
f_affix(f_num(1:5, 2), "-", "%")

f_prefix(LETTERS[1:5], "_")
f_prefix(f_bills(123456789123, -2), "$")

f_suffix(LETTERS[1:5], "_")
f_suffix(f_num(1:5, 2), "%")

## Not run: 
##D f_bills(123456789123, -2) %>%
##D     f_prefix("$")
## End(Not run)



