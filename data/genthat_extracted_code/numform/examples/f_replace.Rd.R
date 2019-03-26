library(numform)


### Name: f_replace
### Title: Replace Characters in Strings
### Aliases: f_replace ff_replace

### ** Examples

f_replace('Cool_Variable')
f_title(f_replace('cool_variable'))
f_replace('Cool_Variable', pattern = '([A-Z])', replacement = '\\L\\1')
cat(f_replace('really long label names are the pits',
    pattern = '\\s', replace = '\n'))



