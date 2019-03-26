library(rdiversity)


### Name: meta_gamma
### Title: Metacommunity gamma diversity
### Aliases: meta_gamma

### ** Examples

pop <- data.frame(a = c(1,3), b = c(1,1))
row.names(pop) <- paste0("sp", 1:2)
pop <- pop/sum(pop)
meta <- metacommunity(pop)

# Calculate metacommunity gamma diversity
meta_gamma(meta, 0:2)




