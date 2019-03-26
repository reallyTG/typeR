library(rdiversity)


### Name: powermean
### Title: Calculate power mean
### Aliases: powermean is.powermean show,powermean-method

### ** Examples

pop <- data.frame(a = c(1,3), b = c(1,1))
row.names(pop) <- paste0("sp", 1:2)
pop <- pop/sum(pop)
meta <- metacommunity(pop)

# Calculate subcommunity raw alpha diversity (takes the powermean)
a <- raw_alpha(meta)
class(a)




