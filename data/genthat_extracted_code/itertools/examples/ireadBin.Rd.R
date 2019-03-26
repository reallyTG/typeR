library(itertools)


### Name: ireadBin
### Title: Create an iterator to read binary data from a connection
### Aliases: ireadBin
### Keywords: utilities

### ** Examples

zz <- file("testbin", "wb")
writeBin(1:100, zz)
close(zz)

it <- ihasNext(ireadBin("testbin", integer(), 10))
while (hasNext(it)) {
  print(nextElem(it))
}
unlink("testbin")



