library(SCBmeanfd)


### Name: scb.equal
### Title: Compare Two Mean Functions
### Aliases: scb.equal

### ** Examples

## Not run: 
##D # Phoneme data: compare the mean log-periodograms 
##D # for phonemes "aa" as the vowel in "dark" and "ao" 
##D # as the first vowel in "water"
##D data(phoneme)
##D n <- nrow(phoneme)
##D N <- ncol(phoneme) 
##D classes <- split(1:n,phoneme[,N])
##D names(classes) <- c("sh", "iy", "dcl", "aa", "ao")
##D freq    <- 1:150
##D compare.aa.ao <- scb.equal(freq, list(phoneme[classes$aa,-N], 
##D   phoneme[classes$ao,-N]), bandwidth = c(.75, .75), scbtype = "both", nboot = 2e3)
##D summary(compare.aa.ao)
## End(Not run)



