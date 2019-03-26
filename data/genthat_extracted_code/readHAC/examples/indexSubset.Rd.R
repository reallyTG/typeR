library(readHAC)


### Name: [.HAC
### Title: Extract tuples.
### Aliases: [.HAC

### ** Examples

## Don't show: 
hacfile <- system.file("hac","Hac-test_000001.hac",package="readHAC")
x <- readHAC(hacfile)
## End(Don't show)
x[1:2]
subset(x, type == 10000)
split(x, x$type)



