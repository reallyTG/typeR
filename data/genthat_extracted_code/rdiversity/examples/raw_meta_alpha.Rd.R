library(rdiversity)


### Name: raw_meta_alpha
### Title: Raw metacommunity alpha diversity
### Aliases: raw_meta_alpha

### ** Examples

pop <- data.frame(a = c(1,3), b = c(1,1))
row.names(pop) <- paste0("sp", 1:2)
pop <- pop/sum(pop)
meta <- metacommunity(pop)

# Calculate raw metacommunity alpha diversity
raw_meta_alpha(meta, 0:2)




