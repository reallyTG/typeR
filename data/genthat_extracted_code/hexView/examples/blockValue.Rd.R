library(hexView)


### Name: blockValue
### Title: Extract the Value of a Binary Block
### Aliases: blockValue blockString
### Keywords: classes

### ** Examples

charBlock <- readRaw(hexViewFile("rawTest.txt"), width=8)
blockValue(charBlock)
blockString(charBlock)

intBlock <- readRaw(hexViewFile("rawTest.int"), human="int")
blockValue(intBlock)



