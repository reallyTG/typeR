library(ggplot2)


### Name: calc_element
### Title: Calculate the element properties, by inheriting properties from
###   its parents
### Aliases: calc_element
### Keywords: internal

### ** Examples

t <- theme_grey()
calc_element('text', t)

# Compare the "raw" element definition to the element with calculated inheritance
t$axis.text.x
calc_element('axis.text.x', t, verbose = TRUE)

# This reports that axis.text.x inherits from axis.text,
# which inherits from text. You can view each of them with:
t$axis.text.x
t$axis.text
t$text



