library(qlcMatrix)


### Name: sim.words
### Title: Similarity-measures for words between two languages, based on
###   co-occurrences in parallel text
### Aliases: sim.words

### ** Examples

data(bibles)

# ----- small example of co-occurrences -----

# as an example, just take partially overlapping parts of two bibles
# sim.words uses the names to get the paralellism right, so this works
eng <- bibles$eng[1:5000]
deu <- bibles$deu[2000:7000]
sim <- sim.words(eng, deu, method = res)

# but the statistics are not perfect (because too little data)
# sorted co-occurrences for the english word "your" in German:
sort(sim["your",], decreasing = TRUE)[1:10]

# ----- complete example of co-occurrences -----

## Not run: 
##D # running the complete bibles takes a bit more time (but still manageable)
##D system.time(sim <- sim.words(bibles$eng, bibles$deu, method = res))
##D 
##D # results are much better
##D # sorted co-occurrences for the english word "your" in German:
##D sort(sim["your",], decreasing = TRUE)[1:10]
##D 
##D # ----- look for 'best' translations -----
##D 
##D # note that selecting the 'best' takes even more time
##D system.time(sim2 <- sim.words(bibles$eng, bibles$deu, method = res, best = TRUE))
##D 
##D # best co-occurrences for the English word "your"
##D which(sim2$best["your",])
##D 
##D # but can be made faster by removing low values
##D # (though the boundary in \code{tol =  5} depends on the method used
##D system.time(sim3 <- sim.words(bibles$eng, bibles$deu, best = TRUE, method = res, tol = 5))
##D 
##D # note that the decision on the 'best' remains the same here
##D all.equal(sim2$best, sim3$best)
##D 
##D # ----- computations also work with other languages -----
##D 
##D # All works completely language-independent
##D # translations for 'we' in Tagalog:
##D sim <- sim.words(bibles$eng, bibles$tgl, best = TRUE, weight = idf, tol = 0.1)
##D which(sim$best["we",])
## End(Not run)



