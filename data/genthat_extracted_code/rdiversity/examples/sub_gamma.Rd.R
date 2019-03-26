library(rdiversity)


### Name: sub_gamma
### Title: Subcommunity gamma diversity
### Aliases: sub_gamma

### ** Examples

pop <- data.frame(a = c(1,3), b = c(1,1))
row.names(pop) <- paste0("sp", 1:2)
pop <- pop/sum(pop)
meta <- metacommunity(pop)

# Calculate subcommunity gamma diversity
sub_gamma(meta, 0:2)




