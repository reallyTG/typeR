library(ggplot2)


### Name: merge_element
### Title: Merge a parent element into a child element
### Aliases: merge_element merge_element.default merge_element.element
### Keywords: internal

### ** Examples

new <- element_text(colour = "red")
old <- element_text(colour = "blue", size = 10)

# Adopt size but ignore colour
merge_element(new, old)




