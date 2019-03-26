library(RAM)


### Name: valid.taxonomy
### Title: Validate And Reformat The OTU Taxonomy Column
### Aliases: valid.taxonomy reformat.taxonomy

### ** Examples

data(ITS1)
## Not run: 
##D # for demonstration purpose only
##D # the ITS1 dataset missing species rank, but it's ok
##D # the problematic taxonomy lineages are those missing proper 
##D # prefix at each rank
##D # see ?RAM.rank.formatting
##D valid.taxonomy(data=list(ITS1=ITS1))
##D input.ranks <- c("kingdom", "phylum", "class", "order", 
##D                  "family", "genus")
##D reform.ITS1 <- reformat.taxonomy(list(ITS1=ITS1),
##D                                  input.ranks=input.ranks,
##D                                  sep="; ")[[1]]
## End(Not run)



