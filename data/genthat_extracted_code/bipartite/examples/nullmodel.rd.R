library(bipartite)


### Name: nullmodel
### Title: Generates null models for network analysis
### Aliases: nullmodel
### Keywords: package

### ** Examples

## Not run: 
##D 	data(Safariland)
##D 	nullmodel(Safariland, N=2, method=1)
##D 	nullmodel(Safariland>0, N=2, method=4)
##D 	# analysis example:
##D 	obs <- unlist(networklevel(Safariland, index="weighted nestedness"))
##D 	nulls <- nullmodel(Safariland, N=100, method=1)
##D 	null <- unlist(sapply(nulls, networklevel, index="weighted nestedness")) #takes a while ...
##D 	
##D 	plot(density(null), xlim=c(min(obs, min(null)), max(obs, max(null))), 
##D 		main="comparison of observed with null model Patefield")
##D 	abline(v=obs, col="red", lwd=2)    
##D 	
##D 	praw <- sum(null>obs) / length(null)
##D 	ifelse(praw > 0.5, 1-praw, praw)    # P-value
##D 	
##D 	# comparison of null model 4 and 5 for binary:
##D 	nulls4 <- nullmodel(Safariland>0, N=100, method=4)
##D 	nulls5 <- nullmodel(Safariland>0, N=100, method=5)
##D 	null4 <- unlist(sapply(nulls4, networklevel, index="weighted nestedness"))
##D 	null5 <- unlist(sapply(nulls5, networklevel, index="weighted nestedness"))
##D 	
##D 	
##D 	plot(density(null4), xlim=range(c(null4, null5)), lwd=2, 
##D 		main="comparison of null models")
##D 	lines(density(null5), col="red", lwd=2)
##D 	legend("topright", c("shuffle", "mgen"), col=c("black", "red"), lwd=c(2,2), 
##D 		bty="n", cex=1.5)
##D 	abline(v=networklevel(Safariland>0, index="weighted nestedness"))
##D 	
## End(Not run)



