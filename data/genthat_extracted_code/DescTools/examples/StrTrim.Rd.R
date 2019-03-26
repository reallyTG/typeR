library(DescTools)


### Name: StrTrim
### Title: Remove Leading/Trailing Whitespace From A String
### Aliases: StrTrim
### Keywords: manip character

### ** Examples

StrTrim("  Hello world! ")

StrTrim("  Hello world! ", method="left")
StrTrim("  Hello world! ", method="right")

# user defined pattern
StrTrim(" ..Hello ... world! ", pattern=" \\.")



