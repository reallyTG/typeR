library(rdiversity)


### Name: raw_rho
### Title: Raw rho (low level diversity component)
### Aliases: raw_rho

### ** Examples

pop <- data.frame(a = c(1,3), b = c(1,1))
row.names(pop) <- paste0("sp", 1:2)
pop <- pop/sum(pop)
meta <- metacommunity(pop)

# Calculate raw rho component
raw_rho(meta)




