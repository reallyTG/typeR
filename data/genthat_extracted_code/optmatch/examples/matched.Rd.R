library(optmatch)


### Name: matched
### Title: Identification of units placed into matched sets
### Aliases: matched unmatched matchfailed
### Keywords: manip

### ** Examples

data(plantdist)

mxpl.fm0 <- fullmatch(plantdist) # A feasible matching problem
c(sum(matched(mxpl.fm0)), sum(unmatched(mxpl.fm0)))
sum(matchfailed(mxpl.fm0))
mxpl.fm1 <- fullmatch(plantdist, # An infeasible problem
                      max.controls=3, min.controls=3)
c(sum(matched(mxpl.fm1)), sum(unmatched(mxpl.fm1)))
sum(matchfailed(mxpl.fm1))

mxpl.si <- factor(c('a', 'a', 'c', rep('d',4), 'b', 'c', 'c', rep('d', 16)))
names(mxpl.si) <- LETTERS[1:26]
mxpl.exactmatch <- exactMatch(mxpl.si, c(rep(1, 7), rep(0, 26 - 7)))
# Subclass a contains two treated units but no controls;
# subclass b contains only a control unit;
# subclass c contains one treated and two control units;
# subclass d contains the remaining twenty units.
# only valid subproblems will be used

mcl <- c(1, Inf)

mxpl.fm2 <- fullmatch(plantdist + mxpl.exactmatch,
                      max.controls=mcl)
sum(matched(mxpl.fm2))

table(unmatched(mxpl.fm2), matchfailed(mxpl.fm2))

mxpl.fm2[matchfailed(mxpl.fm2)]

mxpl.fm2[unmatched(mxpl.fm2) &   # isolated units return as
         !matchfailed(mxpl.fm2)] # unmatched but not matchfailed




