library(lsa)


### Name: associate
### Title: Find close terms in a textmatrix
### Aliases: associate
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
myLSAspace = lsa(myMatrix, dims=dimcalc_share()) 
myNewMatrix = as.textmatrix(myLSAspace) 

# calc associations for mouse
associate(myNewMatrix, "mouse")

# clean up
unlink(td, recursive=TRUE)




