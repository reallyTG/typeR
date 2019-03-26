library(oce)


### Name: matchBytes
### Title: Locate byte sequences in a raw vector
### Aliases: matchBytes

### ** Examples


buf <- as.raw(c(0xa5, 0x11, 0xaa, 0xa5, 0x11, 0x00))
match <- matchBytes(buf, 0xa5, 0x11)
print(buf)
print(match)



