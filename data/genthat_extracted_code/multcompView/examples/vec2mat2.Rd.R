library(multcompView)


### Name: vec2mat2
### Title: Convert a vector of hyphenated names into a character matrix.
### Aliases: vec2mat2
### Keywords: array manip

### ** Examples

vec2mat2(c("a-b", "a-c", "b-c"))

vec2mat2(c("a-b", "b-a"))

## Don't show: 
(tst3 <- substring(try(
 vec2mat2(c("a", "b-a", "b-c"))), 1, 20)
=="Error in vec2mat2(c(")
# Error:  name without a sep character

(tst4 <- substring(try(
 vec2mat2(c("a-c", "b-a", "b-c-d"))), 1, 20)
=="Error in vec2mat2(c(")
# Error:  multiple hyphens (sep characters)

## End(Don't show)



