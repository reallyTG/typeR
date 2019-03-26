library(wavethresh)


### Name: firstdot
### Title: Return the location of the first period character within a
###   character string (for a vector of strings of arbitrary length).
### Aliases: firstdot
### Keywords: utilities

### ** Examples

#
# Let's find the first dot in the following strings...
#
firstdot("mary.had.a.little.lamb")
#[1] 5
#
# I.e. the first period was after "mary" -- the fifth character
#
# This following string doesn't have any periods in it.
#
firstdot("StellaArtois")
#[1] 0
#
# The function works on vectors of character strings
#
TopCricketAve <- c("Don.Bradman", "Graeme.Pollock", "George.Headley",
	"Herbert.Sutcliffe", "Vinod.Kambli", "Javed.Miandad")
firstdot(TopCricketAve)
#[1] 4 7 7 8 6 6



