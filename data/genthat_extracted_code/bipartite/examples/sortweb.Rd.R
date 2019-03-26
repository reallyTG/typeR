library(bipartite)


### Name: sortweb
### Title: Function to sort bipartite webs
### Aliases: sortweb
### Keywords: package

### ** Examples

data(Safariland)
web <- Safariland

sortweb(Safariland, sort.order="dec") 
#rarest species first:
plotweb(sortweb(Safariland, sort.order="inc"), method="normal")   
visweb(sortweb(Safariland,sort.order="inc"), type="diagonal", 
	square="compartment", text="none", frame=TRUE)

# sorted by a given (here random) sequence
sequence <- list(seq.higher=sample(colnames(Safariland)), 
	seq.lower=sample(rownames(Safariland)))
web.ordered <- sortweb(web, sort.order="seq", sequence=sequence)




