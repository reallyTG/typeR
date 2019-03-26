library(rdiversity)


### Name: raw_sub_rho
### Title: Raw subcommunity rho diversity
### Aliases: raw_sub_rho

### ** Examples

pop <- data.frame(a = c(1,3), b = c(1,1))
row.names(pop) <- paste0("sp", 1:2)
pop <- pop/sum(pop)
meta <- metacommunity(pop)

# Calculate raw subcommunity rho diversity
raw_sub_rho(meta, 0:2)




