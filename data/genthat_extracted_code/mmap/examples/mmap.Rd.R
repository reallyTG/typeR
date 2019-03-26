library(mmap)


### Name: mmap
### Title: Map And Unmap Pages of Memory
### Aliases: mmap munmap extractFUN extractFUN<- replaceFUN replaceFUN<-
###   is.mmap as.mmap dim.mmap dim<-.mmap dimnames.mmap dimnames<-.mmap
###   is.array.mmap tempmmap pagesize
### Keywords: utilities

### ** Examples


# create a binary file and map into 'ints' object
# Note that we are creating a file of 1 byte integers,
# and that the conversion is handled transparently
tmp <- tempfile()
ints <- as.mmap(1:100L, mode=int8(), file=tmp)

ints[1]
ints[]
ints[22]
ints[21:23] <- c(0,0,0)
ints[]  # changes are now on disk

# add dimension
dim(ints) <- c(10,10)
ints[]
ints[6,2] # 6th row of 2nd column
ints[ ,2] # entire 2nd column
munmap(ints)

# store Dates as natural-size 'int' on disk
writeBin(as.integer(Sys.Date()+1:10), tmp)
DATE <- mmap(tmp,extractFUN=function(x) structure(x,class="Date"))
DATE[]
munmap(DATE)

# store 2 decimal numeric as 'int' on disk, and convert on extraction
num <- mmap(tmp,extractFUN=function(x) x/100)
num[]
munmap(num)

unlink(tmp)

# convert via as.mmap munmap
int <- as.mmap(1:10L)
num <- as.mmap(rnorm(10))



