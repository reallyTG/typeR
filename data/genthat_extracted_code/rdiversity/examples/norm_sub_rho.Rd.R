library(rdiversity)


### Name: norm_sub_rho
### Title: Normalised subcommunity rho diversity
### Aliases: norm_sub_rho

### ** Examples

pop <- data.frame(a = c(1,3), b = c(1,1))
row.names(pop) <- paste0("sp", 1:2)
pop <- pop/sum(pop)
meta <- metacommunity(pop)

# Calculate normalised subcommunity rho diversity
norm_sub_rho(meta, 0:2)




