library(bigmemory)


### Name: flush
### Title: Updating a big.matrix filebacking.
### Aliases: flush flush,big.matrix-method
### Keywords: methods

### ** Examples

temp_dir = tempdir()
if (!dir.exists(temp_dir)) dir.create(temp_dir)
x <- big.matrix(nrow=3, ncol=3, backingfile='flushtest.bin',
                descriptorfile='flushtest.desc', backingpath=temp_dir,
                type='integer')
x[1,1] <- 0
flush(x)



