library(seqinr)


### Name: comp
### Title: complements a nucleic acid sequence
### Aliases: comp

### ** Examples

##
## Show that comp() does *not* return the reverve complementary strand:
##

c2s(comp(s2c("aaaattttggggcccc")))

##
## Show how to get the reverse complementary strand:
##

c2s(rev(comp(s2c("aaaattttggggcccc"))))

##
## Show what happens with non allowed values:
##

c2s(rev(comp(s2c("aaaaXttttYggggZcccc"))))

##
## Show what happens with ambiguous bases:
##

allbases <- s2c("abcdghkmstvwn")
comp(allbases) # NA are produced
comp(allbases, ambiguous = TRUE) # No more NA

##
## Routine sanity checks:
##

stopifnot(identical(comp(allbases, ambiguous = TRUE), s2c("tvghcdmksabwn")))
stopifnot(identical(comp(c("A", "C", "G", "T"), forceToLower = FALSE), c("T", "G", "C", "A")))



