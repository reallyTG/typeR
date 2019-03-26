library(qlcMatrix)


### Name: sim.wordlist
### Title: Similarity matrices from wordlists
### Aliases: sim.wordlist sim.con sim.lang sim.graph

### ** Examples

# ----- load data -----

# an example wordlist, see help(huber) for details
data(huber)

# ----- similarity between languages -----

# most time is spend splitting the strings
# the rest does not really influence the time needed
system.time( sim <- sim.lang(huber, method = "p") )

# a simple distance-based UPGMA tree
plot(hclust(as.dist(-sim), method = "average"), cex = .7)

## Not run: 
##D 
##D # ----- similarity between concepts -----
##D 
##D # similarity based on bigrams
##D system.time( simB <- sim.con(huber, method = "b") )
##D # similarity based on colexification. much easier to calculate
##D system.time( simC <- sim.con(huber, method = "c") )
##D 
##D # As an example, look at all adjectival concepts
##D adj <- c(1,5,13,14,28,35,40,48,67,89,105,106,120,131,137,146,148,
##D 	171,179,183,188,193,195,206,222,234,259,262,275,279,292,
##D 	294,300,309,341,353,355,359)
##D 
##D # show them as trees
##D par(mfrow = c(1,2)) 
##D plot(hclust(as.dist(-simB[adj,adj]), method = "ward"), 
##D 	cex = .5, main = "bigrams")
##D plot(hclust(as.dist(-simC[adj,adj]), method = "ward"), 
##D 	cex = .5, main = "colexification")
##D par(mfrow = c(1,1))
##D 
##D # ----- similarity between graphemes -----
##D 
##D # this is a very crude approach towards regular sound correspondences
##D # when the languages are not too distantly related, it works rather nicely 
##D # can be used as a quick first guess of correspondences for input in more advanced methods
##D 
##D # all 2080 graphemes in the data by all 2080 graphemes, from all languages
##D system.time( X <- sim.graph(huber) )
##D 
##D # throw away the low values
##D # select just one pair of languages for a quick visualisation
##D X$GG <- drop0(X$GG, tol = 1)
##D colnames(X$GG) <- rownames(X$GG)
##D correspondences <- X$GG[X$GD[,"bora"],X$GD[,"muinane"]]
##D heatmap(as.matrix(correspondences))
## End(Not run)



