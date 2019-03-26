library(rdiversity)


### Name: norm_sub_alpha
### Title: Normalised subcommunity alpha diversity
### Aliases: norm_sub_alpha

### ** Examples

pop <- data.frame(a = c(1,3), b = c(1,1))
row.names(pop) <- paste0("sp", 1:2)
pop <- pop/sum(pop)
meta <- metacommunity(pop)

# Calculate normalised subcommunity alpha diversity
norm_sub_alpha(meta, 0:2)




