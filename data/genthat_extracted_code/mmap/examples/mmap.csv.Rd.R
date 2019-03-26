library(mmap)


### Name: mmap.csv
### Title: Memory Map Text File
### Aliases: mmap.csv
### Keywords: manip data

### ** Examples

data(cars)
tmp <- tempfile()
write.csv(cars, file=tmp, row.names=FALSE)

m <- mmap.csv(tmp)

colnames(m) <- colnames(cars)

m[]

extractFUN(m) <- as.data.frame  # coerce list to data frame upon subset

m[1:3,]

munmap(m)



