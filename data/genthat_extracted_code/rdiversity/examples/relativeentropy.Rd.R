library(rdiversity)


### Name: relativeentropy
### Title: Calculate relative entropy
### Aliases: relativeentropy is.relativeentropy show,relativeentropy-method

### ** Examples

pop <- data.frame(a = c(1,3), b = c(1,1))
row.names(pop) <- paste0("sp", 1:2)
pop <- pop/sum(pop)
meta <- metacommunity(pop)

# Calculate raw subcommunity beta diversity
a <- raw_beta(meta)
class(a)




