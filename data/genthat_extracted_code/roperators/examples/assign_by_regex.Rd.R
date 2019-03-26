library(roperators)


### Name: %regex<-%
### Title: Assign to vector only where regular expression is matched
### Aliases: %regex<-%

### ** Examples

# Overwrite elements that match regex:

 x <- c("a1b", "b1", "c", "d0")

 # overwrite any element containing a number

 x %regex<-% c("\\d+", "x")

 print(x)

 # "x" "b" "c" "x"



