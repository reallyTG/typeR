library(knitr)


### Name: extract_raw_output
### Title: Mark character strings as raw output that should not be
###   converted
### Aliases: extract_raw_output restore_raw_output raw_output

### ** Examples

library(knitr)
out = c("*hello*", raw_output("<special>content</special> *protect* me!"), 
    "*world*")
pre = extract_raw_output(out)
str(pre)
pre$value = gsub("[*]([^*]+)[*]", "<em>\\1</em>", 
    pre$value)  # think this as Pandoc conversion
pre$value
# raw output was protected from the conversion (e.g.
# *protect* was not converted)
restore_raw_output(pre$value, pre$chunks)



