library(rdiversity)


### Name: raw_meta_rho
### Title: Raw metacommunity rho diversity
### Aliases: raw_meta_rho

### ** Examples

pop <- data.frame(a = c(1,3), b = c(1,1))
row.names(pop) <- paste0("sp", 1:2)
pop <- pop/sum(pop)
meta <- metacommunity(pop)

# Calculate metacommunity rho diversity
raw_meta_rho(meta, 0:2)




