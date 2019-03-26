library(qlcMatrix)


### Name: splitText
### Title: Construct sparse matrices from parallel texts
### Aliases: splitText read.text

### ** Examples

# a trivial examples to see the results of this function:
text <- c("This is a sentence .","A sentence this is !","Is this a sentence ?")
splitText(text)
splitText(text, simplify = TRUE, lowercase = FALSE)

## Not run: 
##D # reasonably quick with complete bibles (about 1-2 second per complete bible)
##D # texts with only New Testament is even quicker
##D data(bibles)
##D system.time(eng <- splitText(bibles$eng, bibles$verses))
##D system.time(deu <- splitText(bibles$deu, bibles$verses))
##D 
##D # Use example: Number of co-ocurrences between two bibles
##D # How often do words from the one language cooccur with words from the other language?
##D ENG <- (eng$wW * 1) %*% (eng$WR * 1) %*% (eng$RS * 1)
##D DEU <- (deu$wW * 1) %*% (deu$WR * 1) %*% (deu$RS * 1)
##D C <- tcrossprod(ENG,DEU)
##D rownames(C) <- eng$lowercase
##D colnames(C) <- deu$lowercase
##D C[	c("father","father's","son","son's"),
##D 	c("vater","vaters","sohn","sohne","sohnes","sohns")
##D 	]
##D 
##D # Pure counts are not very interesting. This is better:
##D R <- assocSparse(t(ENG), t(DEU))
##D rownames(R) <- eng$lowercase
##D colnames(R) <- deu$lowercase
##D R[	c("father","father's","son","son's"),
##D 	c("vater","vaters","sohn","sohne","sohnes","sohns")
##D 	]
##D 
##D # For example: best co-occurrences for the english word "mine"
##D sort(R["mine",], decreasing = TRUE)[1:10]
##D 
##D # To get a quick-and-dirty translation matrix:
##D # adding maxima from both sides work quite well
##D best <-	  colMax(R, which = TRUE, ignore.zero = FALSE)$which 
##D 	+ rowMax(R,which = TRUE, ignore.zero = FALSE)$which
##D best <- as(best, "nMatrix")
##D 
##D which(best["your",])
##D which(best["went",])
##D 
##D # all of the above is also performed by the function sim.words
##D 
##D # A final speed check:
##D # split all 4 texts, and simplify them into one matrix
##D # They have all the same columns, so they can be rbind
##D system.time(all <- sapply(bibles[-1], function(x){splitText(x, bibles$verses, simplify = TRUE)}))
##D all <- do.call(rbind, all)
##D 
##D # then try a single co-occerrence measure on all pairs from these 72K words
##D # (so we are doing about 2.6e9 comparisons here!)
##D system.time( S <- cosSparse(t(all)) )
##D 
##D # this goes extremely fast! As long as everything fits into RAM this works nicely.
##D # Note that S quickly gets large
##D print(object.size(S), units = "auto")
##D 
##D # but most of it can be thrown away, because it is too low anyway
##D # this leads to a factor 10 reduction in size:
##D S <- drop0(S, tol = 0.2)
##D print(object.size(S), units = "auto")
## End(Not run)



