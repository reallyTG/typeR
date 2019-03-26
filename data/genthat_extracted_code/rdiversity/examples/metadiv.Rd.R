library(rdiversity)


### Name: metadiv
### Title: Calculate metacommunity-level diversity
### Aliases: metadiv metadiv,powermean-method
###   metadiv,relativeentropy-method metadiv,metacommunity-method

### ** Examples

# Define metacommunity
pop <- data.frame(a = c(1,3), b = c(1,1))
pop <- pop / sum(pop)
meta <- metacommunity(pop)

# Calculate metacommunity gamma diversity (takes the power mean)
g <- raw_gamma(meta)
metadiv(g, 0:2)

# Calculate metacommunity beta diversity (takes the relative entropy)
b <- raw_beta(meta)
metadiv(b, 0:2)

# Calculate all measures of metacommunity diversity
metadiv(meta, 0:2)




