library(rdiversity)


### Name: norm_beta
### Title: Normalised beta (low level diversity component)
### Aliases: norm_beta

### ** Examples

pop <- data.frame(a = c(1,3), b = c(1,1))
row.names(pop) <- paste0("sp", 1:2)
pop <- pop/sum(pop)
meta <- metacommunity(pop)

# Calculate normalised beta component
norm_beta(meta)




