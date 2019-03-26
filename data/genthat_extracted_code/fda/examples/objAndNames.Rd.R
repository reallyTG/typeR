library(fda)


### Name: objAndNames
### Title: Add names to an object
### Aliases: objAndNames
### Keywords: attribute

### ** Examples

# The following should NOT check 'anything' here
tst1 <- objAndNames(1:2, list(letters[1:2], LETTERS[1:2]), anything)
all.equal(tst1, c(a=1, b=2))

# The following should return 'object unchanged
tst2 <- objAndNames(1:2, NULL, list(letters))
all.equal(tst2, 1:2)


tst3 <- objAndNames(1:2, list("a", 2), list(letters[1:2]))
all.equal(tst3, c(a=1, b=2) )

# The following checks a matrix / array
tst4 <- array(1:6, dim=c(2,3))
tst4a <- tst4
dimnames(tst4a) <- list(letters[1:2], LETTERS[1:3])
tst4b <- objAndNames(tst4, 
       list(letters[1:2], LETTERS[1:3]), anything)
all.equal(tst4b, tst4a)

tst4c <- objAndNames(tst4, NULL,        
       list(letters[1:2], LETTERS[1:3]) )
all.equal(tst4c, tst4a)




