library(qdap)


### Name: chunker
### Title: Break Text Into Ordered Word Chunks
### Aliases: chunker
### Keywords: chunks group text

### ** Examples

with(DATA, chunker(state, n.chunks = 10))
with(DATA, chunker(state, n.words = 10))
with(DATA, chunker(state, n.chunks = 10, as.string=FALSE))
with(DATA, chunker(state, n.chunks = 10, rm.unequal=TRUE))
with(DATA, chunker(state, person, n.chunks = 10))
with(DATA, chunker(state, list(sex, adult), n.words = 10))
with(DATA, chunker(state, person, n.words = 10, rm.unequal=TRUE))

## Bigger data
with(hamlet, chunker(dialogue, person, n.chunks = 10))
with(hamlet, chunker(dialogue, person, n.words = 300))

## Not run: 
##D ## with polarity hedonmetrics
##D dat <- with(pres_debates2012[pres_debates2012$person %in% qcv(OBAMA, ROMNEY), ], 
##D     chunker(dialogue, list(person, time), n.words = 300))
##D 
##D dat2 <- colsplit2df(list2df(dat, "dialogue", "person&time")[, 2:1])
##D 
##D dat3 <- split(dat2[, -2], dat2$time)
##D ltruncdf(dat3, 10, 50)
##D 
##D poldat <- lapply(dat3, function(x) with(x, polarity(dialogue, person, constrain = TRUE)))
##D 
##D 
##D m <- lapply(poldat, function(x) plot(cumulative(x)))
##D m <- Map(function(w, x, y, z) {
##D         w + ggtitle(x) + xlab(y) + ylab(z)
##D     }, 
##D         m, 
##D         paste("Debate", 1:3), 
##D         list(NULL, NULL, "Duration (300 Word Segment)"), 
##D         list(NULL, "Cumulative Average Polarity", NULL)
##D )
##D 
##D library(gridExtra)
##D do.call(grid.arrange, m)
##D 
##D ## By person
##D ## By person
##D poldat2 <- Map(function(x, x2){
##D 
##D     scores <- with(counts(x), split(polarity, person))
##D     setNames(lapply(scores, function(y) {
##D         y <- list(cumulative_average_polarity = y)
##D         attributes(y)[["constrained"]] <- TRUE
##D         qdap:::plot.cumulative_polarity(y) + xlab(NULL) + ylab(x2)
##D     }), names(scores))
##D 
##D }, poldat, paste("Debate", 1:3))
##D 
##D poldat2 <- lapply(poldat2, function(x) {
##D     x[[2]] <- x[[2]] + ylab(NULL)
##D     x
##D })
##D 
##D poldat2[[1]] <- Map(function(x, y) {
##D         x + ggtitle(y)
##D     },
##D         poldat2[[1]], qcv(Obama, Romney)
##D )
##D 
##D library(gridExtra)
##D do.call(grid.arrange, unlist(poldat2, recursive=FALSE))
## End(Not run)



