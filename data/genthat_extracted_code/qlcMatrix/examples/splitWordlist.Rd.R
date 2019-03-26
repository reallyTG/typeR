library(qlcMatrix)


### Name: splitWordlist
### Title: Construct sparse matrices from comparative wordlists (aka
###   'Swadesh list')
### Aliases: splitWordlist

### ** Examples

# ----- load data -----

# an example wordlist, see the help(huber) for details
data(huber)

# ----- show output -----

# a selection, to see the result of splitWordlist
# only show the simplified output here, 
# the full output is rather long even for just these six words
sel <- c(1:3, 1255:1258)
splitWordlist(huber[sel,], simplify = TRUE)

## Not run: 
##D 
##D # ----- split complete data -----
##D 
##D # splitting the complete wordlist is a lot of work !
##D # it won't get much quicker than this
##D # most time goes into the string-splitting of the almost 26,000 words
##D # Default version, included splitStrings:
##D system.time( H <- splitWordlist(huber) )
##D 
##D # Simplified version without splitStrings is much quicker:
##D system.time( H <- splitWordlist(huber, splitstrings = FALSE, simplify = TRUE) )
##D 
##D # ----- investigate colexification -----
##D 
##D # The simple version can be used to check how often two concepts 
##D # are expressed identically across all languages ('colexification')
##D H <- splitWordlist(huber, splitstrings = FALSE, simplify = TRUE)
##D sim <- tcrossprod(H$CW*1)
##D 
##D # select only the frequent colexifications for a quick visualisation
##D diag(sim) <- 0
##D sim <- drop0(sim, tol = 5)
##D sim <- sim[rowSums(sim) > 0, colSums(sim) > 0]
##D plot( hclust(as.dist(-sim), method = "average"), cex = .5)
##D 
##D # ----- investigate regular sound correspondences -----
##D 
##D # One central problem with data from many languages is the variation of orthography
##D # It is preferred to solve that problem separately
##D # e.g. check the column "TOKENS" in the huber data
##D # This is a grapheme-separated version of the data.
##D # can be used to investigate co-occurrence of graphemes (approx. phonemes)
##D H <- splitWordlist(huber, counterparts = "TOKENS", sep = " ")
##D 
##D # co-occurrence of all pairs of the 2150 different graphemes through all languages
##D system.time( G <- assocSparse( (H$CW*1) %*% t(H$SW*1) %*% t(H$GS*1), method = poi))
##D rownames(G) <- colnames(G) <- H$graphemes
##D G <- drop0(G, tol = 1)
##D 
##D # select only one language pair for a quick visualisation
##D # check the nice sound changes between bora and muinane!
##D GD <- H$GS %*% H$SW %*% t(H$DW)
##D colnames(GD) <- H$doculects
##D correspondences <- G[GD[,"bora"],GD[,"muinane"]]
##D heatmap(as.matrix(correspondences))
## End(Not run)



