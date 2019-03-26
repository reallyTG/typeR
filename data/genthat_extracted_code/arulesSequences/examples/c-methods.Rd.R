library(arulesSequences)


### Name: c-methods
### Title: Combining Objects
### Aliases: c c,sequences-method c,timedsequences-method
###   c,sequencerules-method
### Keywords: manip attribute

### ** Examples

## continue example
example(ruleInduction, package = "arulesSequences")
s <- c(s1, s2)
s
match(unique(s), s1)

## combine rules
r <- c(r2, r2[1:2])
r
match(unique(r), r2)

## combine timed sequences
z <- as(zaki, "timedsequences")
match(z, c(z[1], z[-1]))



