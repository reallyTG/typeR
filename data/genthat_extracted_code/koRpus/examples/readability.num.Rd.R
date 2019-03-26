library(koRpus)


### Name: readability.num
### Title: Calculate readability
### Aliases: readability.num

### ** Examples

## Not run: 
##D test.features <- list(
##D  sentences=18,
##D  words=556,
##D  letters=c(all=2918, l1=19, l2=92, l3=74, l4=80, l5=51, l6=49),
##D  syllables=c(all=974, s1=316, s2=116),
##D  punct=78,
##D  all.chars=3553,
##D  prepositions=74,
##D  conjunctions=18,
##D  pronouns=9,
##D  foreign=0,
##D  TTR=0.5269784,
##D  Bormuth.NOL=192,
##D  Dale.Chall.NOL=192,
##D  Harris.Jacobson.NOL=240,
##D  Spache.NOL=240)
##D 
##D # should not calculate FOG, because FOG.hard.words is missing:
##D readability.num(test.features, index="all")
## End(Not run)



