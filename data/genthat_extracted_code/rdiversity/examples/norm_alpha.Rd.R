library(rdiversity)


### Name: norm_alpha
### Title: Normalised alpha (low level diversity component)
### Aliases: norm_alpha

### ** Examples

pop <- data.frame(a = c(1,3), b = c(1,1))
row.names(pop) <- paste0("sp", 1:2)
pop <- pop/sum(pop)
meta <- metacommunity(pop)

# Calculate normalised alpha component
norm_alpha(meta)




