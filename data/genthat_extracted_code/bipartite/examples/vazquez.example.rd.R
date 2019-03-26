library(bipartite)


### Name: vazquez.example
### Title: Examples for some analyses
### Aliases: vazquez.example confint intasymm intereven mlik netstats
###   plotmat quant2bin sortmatr sortmatrext
### Keywords: package

### ** Examples

## Not run: 
##D 	data(Safariland)
##D 	
##D 	# confint:
##D 	N100 <- sapply(swap.web(100, Safariland), networklevel, index="nestedness")
##D 	quantile(unlist(N100), c(0.025, 0.975))
##D 	# intasymm: extract values for the asymmetry of interactions and the 
##D 	# dependency matrix for pollinators:
##D 	specieslevel(Safariland)$"higher trophic level"$"interaction push/pull"
##D 	specieslevel(Safariland)$"higher trophic level"$"dependence"
##D 	# for plants:
##D 	specieslevel(Safariland)$"lower trophic level"$"interaction push/pull"
##D 	specieslevel(Safariland)$"lower trophic level"$"dependence"
##D 	
##D 	#intereven
##D 	networklevel(Safariland, index="interaction evenness", intereven="sum")[2]
##D 	# or, as we recommend (see help on networklevel):
##D 	networklevel(Safariland, index="interaction evenness", intereven="prod")[2]
##D 		
##D 	# mlik:
##D 	# calculates the log-likelihood of observing a network, given a probability  
##D 	# matrix of the same size (pweb):
##D 	dmultinom(Safariland>0, prob=pweb, log=TRUE)
##D 	# AIC (the number of parameters is given by how many constraints are put onto the 
##D 	# null model; here, we constrain 9 rows and 27 columns, i.e. sum(dim(binweb))):
##D 	-2*dmultinom(Safariland>0, prob=pweb, log=TRUE) + 2*(sum(dim(binweb)))
##D 	
##D 	# netstats:
##D 	networklevel(Safariland, 
##D 	  index=c("connectance", "interaction evenness", "nestedness", "ISA"))
##D 	mean(specieslevel(Safariland)$"higher trophic level"$"interaction push/pull")
##D 	mean(specieslevel(Safariland)$"lower trophic level"$"interaction push/pull")
##D 	
##D 	#plotmat:
##D 	visweb(t(unname(Safariland)), circles=TRUE, boxes=FALSE)
##D 	
##D 	#sortmatr/sortmatrext:
##D 	sortweb(Safariland, sort.order="inc") #rares species first
##D 	plotweb(sortweb(Safariland, sort.order="dec"), method="normal")
##D 	plotweb(sortweb(web=Safariland, sort.order="seq", 
##D 	  sequence=list(seq.higher=sample(colnames(Safariland)), 
##D 	  seq.lower=sample(rownames(Safariland)))), 
##D 	  method="normal")
##D 	
## End(Not run)



