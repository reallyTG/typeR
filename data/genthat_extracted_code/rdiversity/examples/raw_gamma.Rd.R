library(rdiversity)


### Name: raw_gamma
### Title: Gamma (low level diversity component)
### Aliases: raw_gamma

### ** Examples

pop <- data.frame(a = c(1,3), b = c(1,1))
row.names(pop) <- paste0("sp", 1:2)
pop <- pop/sum(pop)
meta <- metacommunity(pop)

# Calculate gamma component
raw_gamma(meta)




