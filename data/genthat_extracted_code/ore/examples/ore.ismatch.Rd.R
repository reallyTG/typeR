library(ore)


### Name: ore.ismatch
### Title: Does text match a regex?
### Aliases: %~% %~|% %~~% ore.ismatch ore_ismatch

### ** Examples

# Test for the presence of a vowel
ore.ismatch("[aeiou]", c("sky","lake"))  # => c(FALSE,TRUE)

# The same thing, in shorter form
c("sky","lake") %~% "[aeiou]"

# Same again: the first argument must be an "ore" object this way around
ore("[aeiou]") %~% c("sky","lake")



