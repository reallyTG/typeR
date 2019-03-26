library(binaryLogic)


### Name: binaryPrefix
### Title: Binary prefix (KiB,MiB,..)
### Aliases: binaryPrefix

### ** Examples

#Get the number of byte needed to hold 0.5 and 1:10 KiB
binaryPrefix(c(0.5,1:10),"KiB")
#Get the number of bit needed to hold 1 KiB
binaryPrefix(1,"KiB")*byte()



