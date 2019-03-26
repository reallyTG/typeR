library(forcats)


### Name: fct_expand
### Title: Add additional levels to a factor
### Aliases: fct_expand

### ** Examples

f <- factor(sample(letters[1:3], 20, replace = TRUE))
f
fct_expand(f, "d", "e", "f")
fct_expand(f, letters[1:6])



