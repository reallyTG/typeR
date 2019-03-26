library(DescTools)


### Name: FixToTable
### Title: Convert a Text to a Table
### Aliases: FixToTable
### Keywords: manip

### ** Examples

# let's get some tabbed text
txt <- matrix(capture.output(Titanic[,,2,1]))
FixToTable(txt[-1,])



