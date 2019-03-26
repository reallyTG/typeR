library(rdiversity)


### Name: raw_sub_beta
### Title: Raw subcommunity beta diversity
### Aliases: raw_sub_beta

### ** Examples

pop <- data.frame(a = c(1,3), b = c(1,1))
row.names(pop) <- paste0("sp", 1:2)
pop <- pop/sum(pop)
meta <- metacommunity(pop)

# Calculate raw subcommunity beta diversity
raw_sub_beta(meta, 0:2)




