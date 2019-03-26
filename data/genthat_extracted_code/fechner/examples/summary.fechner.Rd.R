library(fechner)


### Name: summary.fechner
### Title: Summary Method for Objects of Class fechner
### Aliases: summary.fechner
### Keywords: methods print univar

### ** Examples

## Fechnerian scaling of dataset wish
f.scal.wish <- fechner(wish)

## results are summarized for comparison levels 2 and 5
summary(f.scal.wish)
summary(f.scal.wish, level = 5)

## accessing detailed summaries through assignment
str(detailed.summary.l1 <- summary(f.scal.wish))
detailed.summary.l5 <- summary(f.scal.wish, level = 5)
detailed.summary.l5$pairs.used.for.comparison[1, ]

## to verify the obtained summaries
f.scal.wish$geodesic.loops
f.scal.wish$S.index
f.scal.wish$overall.Fechnerian.distances



