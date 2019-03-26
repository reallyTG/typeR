### R code from vignette source 'mmap.Rnw'

###################################################
### code chunk number 1: set_seed
###################################################
set.seed(123)


###################################################
### code chunk number 2: as_mmap
###################################################
library(mmap)

r <- rnorm(20e6)
gc()

r <- as.mmap(r)
r

gc()


###################################################
### code chunk number 3: mmap_extract
###################################################
r[1:10]
r[87643]
head(r)
tail(r)
length(r)
r[1:10] <- 1:10
r[87643] <- 3.14159265
head(r)
r[87643]
munmap(r)


###################################################
### code chunk number 4: types1
###################################################
tmp <- tempfile()

writeBin(1:10L, tmp, size=1)  # write int as 1 byte
readBin(tmp, integer(), size=1, signed=TRUE, n=10) # read back in to verify

file.info(tmp)$size  # only 10 bytes on disk


###################################################
### code chunk number 5: mmap_int8
###################################################
m <- mmap(file=tmp, mode=int8())
m[]
nbytes(m)
munmap(m)


###################################################
### code chunk number 6: types
###################################################
# write out a vector of upper case letters as a char * array
writeBin(LETTERS, tmp)  
let <- mmap(tmp, char(1))
let
let[]
munmap(let)
#
# view the data as a series of bytes instead, using raw()
let <- mmap(tmp, raw())
let[]
munmap(let)
#
# view the data as a series of short integers 
let <- mmap(tmp, int16())
let[]
munmap(let)


###################################################
### code chunk number 7: struct
###################################################
# 2-byte (int16)
# 4-byte (int32 or integer)
# 8-byte float (real64 or double)
record.type <- struct(short=int16(),int=int32(),double=real64())
record.type
nbytes(record.type) # 14 bytes in total


###################################################
### code chunk number 8: struct_create
###################################################
writeBin(rep(raw(nbytes(record.type)), 100), tmp)
m <- mmap(tmp, record.type)
#ids <- sapply(1:100, function(X) paste(sample(letters,3),collapse=""))
m[] <- list(1:100L, sample(1e6,100), rnorm(100))#, ids)


###################################################
### code chunk number 9: struct_extract
###################################################
#m <- mmap(tmp, record.type)
m[1]
m[1:3]
m[1:3, "short"]
length(m)


###################################################
### code chunk number 10: struct_df
###################################################
extractFUN(m) <- function(X) do.call(data.frame, X)
extractFUN(m)


###################################################
### code chunk number 11: struct_df_ex
###################################################
m[1]
m[2:5]
m[2:5, "double"] # note that subset is on mmap, returning a new data.frame
m[2:5, 2]
m[1:9][,"double"]  # second brackets act on d.f., as the first is on the mmap


###################################################
### code chunk number 12: struct_df_ex_cleanup
###################################################
munmap(m)


###################################################
### code chunk number 13: logical_test
###################################################
one.to.onemil <- 1:1e6L
writeBin(1:1e6L, tmp)
m <- mmap(tmp, int32())
str(m < 100)
str(which(one.to.onemil < 100))
system.time(m < 100)
system.time(which(one.to.onemil < 100))


###################################################
### code chunk number 14: logical_cleanup
###################################################
munmap(m)
rm(one.to.onemil)


