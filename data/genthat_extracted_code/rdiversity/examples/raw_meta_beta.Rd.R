library(rdiversity)


### Name: raw_meta_beta
### Title: Raw metacommunity beta diversity
### Aliases: raw_meta_beta

### ** Examples

pop <- data.frame(a = c(1,3), b = c(1,1))
row.names(pop) <- paste0("sp", 1:2)
pop <- pop/sum(pop)
meta <- metacommunity(pop)

# Calculate raw metacommunity beta diversity
raw_meta_beta(meta, 0:2)




