library(FSA)


### Name: fact2num
### Title: Converts "numeric" factor levels to numeric values.
### Aliases: fact2num
### Keywords: manip

### ** Examples

junk <- factor(c(1,7,2,4,3,10))
str(junk)
junk2 <- fact2num(junk)
str(junk2)

## ONLY RUN IN INTERACTIVE MODE
if (interactive()) {

bad <- factor(c("A","B","C"))
# This will result in an error -- levels are not 'numeric'
bad2 <- fact2num(bad)

}  ## END IF INTERACTIVE MODE




