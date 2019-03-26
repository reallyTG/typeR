library(lsa)


### Name: sample.textmatrix
### Title: Create a random sample of files
### Aliases: sample.textmatrix
### Keywords: algebra

### ** Examples


# create some files
td = tempfile()
dir.create(td)
write( c("dog", "cat", "mouse"), file=paste(td, "D1", sep="/"))
write( c("hamster", "mouse", "sushi"), file=paste(td, "D2", sep="/"))
write( c("dog", "monster", "monster"), file=paste(td, "D3", sep="/"))
write( c("dog", "mouse", "dog"), file=paste(td, "D4", sep="/"))

# create matrices
myMatrix = textmatrix(td, minWordLength=1)

sample(myMatrix, 3)

# clean up
unlink(td, recursive=TRUE)




