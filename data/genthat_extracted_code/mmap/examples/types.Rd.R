library(mmap)


### Name: C_types
### Title: Virtual R Types On Disk.
### Aliases: types as.Ctype is.Ctype bits logi8 logi32 char uchar cplx int8
###   uint8 int16 uint16 int24 uint24 int32 int64 real32 real64 as.char
###   as.uchar as.cplx as.int8 as.uint8 as.int16 as.uint16 as.int24
###   as.uint24 as.int32 as.real32 as.real64 nbytes
### Keywords: IO

### ** Examples

tmp <- tempfile()

# write a 1 byte signed integer -128:127
writeBin(-127:127L, tmp, size=1L)
file.info(tmp)$size
one_byte <- mmap(tmp, int8())
one_byte[]
munmap(one_byte)

# write a 1 byte unsigned integer 0:255
writeBin(0:255L, tmp, size=1L)
file.info(tmp)$size
one_byte <- mmap(tmp, uint8())
one_byte[]
munmap(one_byte)

# write a 2 byte integer -32768:32767
writeBin(c(-32768L,32767L), tmp, size=2L)
file.info(tmp)$size
two_byte <- mmap(tmp, int16())
two_byte[]
munmap(two_byte)

# write a 2 byte unsigned integer 0:65535
writeBin(c(0L,65535L), tmp, size=2L)
two_byte <- mmap(tmp, uint16())
two_byte[]

# replacement methods automatically (watch precision!!)
two_byte[1] <- 50000
two_byte[]

# values outside of range (above 65535 for uint16 will be wrong)
two_byte[1] <- 65535 + 1
two_byte[]

munmap(two_byte)

# write a 4 byte integer standard R type
writeBin(1:10L, tmp, size=4L)
four_byte <- mmap(tmp, int32())
four_byte[]
munmap(four_byte)

# write 32 bit integers as 64 bit longs (where supported)
int64()  # note it is a double in R, but described as int64
writeBin(1:10L, tmp, size=8L)
eight_byte <- mmap(tmp, int64())
storage.mode(eight_byte[])  # using R doubles to preserve most long values
eight_byte[5] <- 2^40  # write as a long, a value in R that is double
eight_byte[5]
munmap(eight_byte)

unlink(tmp)



