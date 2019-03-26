library(tabr)


### Name: repeats
### Title: Repeat phrases
### Aliases: repeats rp pct volta

### ** Examples

x <- phrase("c ec'g' ec'g'", "4 4 2", "5 432 432")
e1 <- phrase("a", 1, 5) # ending 1
e2 <- phrase("b", 1, 5) # ending 2

rp(x) # simple unfolded repeat, one repeat or two plays
rp(x, 3) # three repeats or four plays

pct(x) # one repeat or two plays
pct(x, 9, TRUE, 5) # 10 plays, add counter every 5 steps
pct(x, 9, TRUE, 5, FALSE) # as above, but do not reset counter settings

volta(x) # one repeat or two plays
volta(x, 1, list(e1, e2)) # one repeat with alternate ending
volta(x, 4, list(e1, e2)) # multiple repeats but with only one alternate ending
volta(x, 4) # no alternates, more than one repeat



