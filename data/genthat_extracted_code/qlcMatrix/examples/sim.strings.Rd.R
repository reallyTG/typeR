library(qlcMatrix)


### Name: sim.strings
### Title: String similarity by cosine similarity between bigram vectors
### Aliases: sim.strings

### ** Examples

# ----- simple example -----

example <- c("still","till","stable","stale","tale","tall","ill","all")
( sim <- round( sim.strings(example), digits = 3) )

# show similarity in non-metric MDS
library(MASS)
mds <- isoMDS( as.dist(1-sim) )$points
plot(mds, type = "n", ann = FALSE, axes = FALSE)
text(mds, labels = example, cex = .7)

## Not run: 
##D 
##D # ----- large example -----
##D 
##D # This similarity is meant to be used for large lists of wordforms.
##D # for example, all 15526 wordforms from the English Dalby Bible
##D # takes just a few seconds for the more than 1e8 pairwise comparisons
##D data(bibles)
##D words <- splitText(bibles$eng)$wordforms
##D system.time( sim <- sim.strings(words) )
##D 
##D # see most similar words
##D rownames(sim) <- colnames(sim) <- words
##D sort(sim["walk",], decreasing = TRUE)[1:10]
##D 
##D # just compare all words to "walk". This is the same as above, but less comparisons
##D # note that the overhead for the sparse conversion and matching of matrices is large
##D # this one is faster than doing all comparisons, but only be a factor 10
##D system.time( sim <- sim.strings(words, "walk"))
##D names(sim) <- words
##D sort(sim, decreasing = TRUE)[1:10]
##D 
##D # ----- comparison with Levinshtein -----
##D 
##D # don't try this with 'adist' from the utils package, it will take long!
##D # for a comparison, only take 2000 randomly selected strings: about a factor 30 slower
##D w <- sample(words, 2000)
##D system.time( sim1 <- sim.strings(w) )
##D system.time( sim2 <- adist(w) )
##D 
##D # compare the current approach with relative levenshtein similarity
##D # = number of matches / ( number of edits + number of matches)
##D # for reasons of speed, just take 1000 random words from the english bible
##D w <- sample(words, 1000)
##D sim1 <- sim.strings(w)
##D tmp <- adist(w, counts = TRUE)
##D sim2 <- 1- ( tmp / nchar(attr(tmp, "trafos")) )
##D 
##D # plotting relation between the two 'heatmap-style'
##D # not identical, but usefully similar
##D image( log(table(
##D 		round(as.dist(sim1) / 3, digits = 2) * 3,
##D 		round(as.dist(sim2) / 3, digits = 2) * 3 )),
##D 	xlab = "bigram similarity", ylab = "relative Levenshtein similarity")
##D 
##D 
##D 
##D 
##D 
##D 
## End(Not run)



