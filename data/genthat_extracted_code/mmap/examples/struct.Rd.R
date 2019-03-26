library(mmap)


### Name: struct
### Title: Construct a Ctype struct
### Aliases: struct pad as.struct is.struct as.list.Ctype
### Keywords: programming IO iteration

### ** Examples

tmp <- tempfile()

f <- file(tmp, open="ab")
u_int_8 <- c(1L, 255L, 22L)  # 1 byte, valid range 0:255
int_8 <- c(1L, -127L, -22L)  # 1 byte, valid range -128:127
u_int_16 <- c(1L, 65000L, 1000L) # 2 byte, valid range 0:65+k
int_16 <- c(1L, 25000L, -1000L) # 2 byte, valid range -32k:32k
int_32 <- c(98743L, -9083299L, 0L) # 4 byte, standard R integer
float_32 <- c(9832.22, 3.14159, 0.00001)
cplx_64 <- c(1+0i, 0+8i, 2+2i)

# not yet supported in struct
char_ <- writeBin(as.raw(1:3), raw())
fixed_width_string <- c("ab","cd","ef")

for(i in 1:3) {
  writeBin(u_int_8[i],  f, size=1L)
  writeBin(int_8[i],    f, size=1L)
  writeBin(u_int_16[i], f, size=2L)
  writeBin(int_16[i],   f, size=2L)
  writeBin(int_32[i],   f, size=4L)
  writeBin(float_32[i], f, size=4L)  # store as 32bit - prec issues
  writeBin(float_32[i], f, size=8L)  # store as 64bit
  writeBin(cplx_64[i],  f)
  writeBin(char_[i], f)
  writeBin(fixed_width_string[i], f)
}
close(f)

m <- mmap(tmp, struct(uint8(),
                      int8(),
                      uint16(),
                      int16(), 
                      int32(),
                      real32(),
                      real64(),
                      cplx(),
                      char(),  # also raw()
                      char(2)  # character array of n characters each
                     ))  
length(m) # only 3 'struct' elements
str(m[])

m[1:2]

# add a post-processing function to convert some elements (rows) to a data.frame
extractFUN(m) <- function(x,i,...) {
                   x <- x[i]
                   data.frame(u_int_8=x[[1]],
                                int_8=x[[2]],
                               int_16=x[[3]],
                               int_32=x[[4]],
                               float_32=x[[5]],
                               real_64=x[[6]]
                             )
                 }
m[1:2]
munmap(m)

# grouping commonly fetched data by row reduces
# disk IO, as values reside together on a page
# in memory (which is paged in by mmap). Here
# we try 3 columns, or one row of 3 values.
# note that with structs we replicate a row-based
# structure.
#
# 13 byte struct
x <- c(writeBin(1L, raw(), size=1),
       writeBin(3.14, raw(), size=4),
       writeBin(100.1, raw(), size=8))
writeBin(rep(x,1e6), tmp)
length(x)
m <- mmap(tmp, struct(int8(),real32(),real64()))
length(m)
m[1]

# create the columns in seperate files (like a column
# store)
t1 <- tempfile()
t2 <- tempfile()
t3 <- tempfile()
writeBin(rep(x[1],1e6), t1)
writeBin(rep(x[2:5],1e6), t2)
writeBin(rep(x[6:13],1e6), t3)

m1 <- mmap(t1, int8())
m2 <- mmap(t2, real32())
m3 <- mmap(t3, real64())
list(m1[1],m2[1],m3[1])

i <- 5e5:6e5

# note that times are ~3x faster for the struct
# due to decreased disk IO and CPU cost to process
system.time(for(i in 1:100) m[i])
system.time(for(i in 1:100) m[i])
system.time(for(i in 1:100) list(m1[i],m2[i],m3[i]))
system.time(for(i in 1:100) list(m1[i],m2[i],m3[i]))
system.time(for(i in 1:100) {m1[i];m2[i];m3[i]}) # no cost to list()

# you can skip struct members by specifying offset and bytes
m <- mmap(tmp, struct(int8(),
                     #real32(),   here we are skipping the 4 byte float
                      real64(),
                      offset=c(0,5), bytes=13))
# alternatively you can add padding directly
n <- mmap(tmp, struct(int8(), pad(4), real64()))

pad(4)
pad(int32())

m[1]
n[1]

munmap(m)
munmap(n)
munmap(m1)
munmap(m2)
munmap(m3)
unlink(t1)
unlink(t2)
unlink(t3)
unlink(tmp)




