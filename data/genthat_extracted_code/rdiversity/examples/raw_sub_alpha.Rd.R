library(rdiversity)


### Name: raw_sub_alpha
### Title: Raw subcommunity alpha diversity
### Aliases: raw_sub_alpha

### ** Examples

pop <- data.frame(a = c(1,3), b = c(1,1))
row.names(pop) <- paste0("sp", 1:2)
pop <- pop/sum(pop)
meta <- metacommunity(pop)

# Calculate raw subcommunity alpha diversity
raw_sub_alpha(meta, 0:2)




