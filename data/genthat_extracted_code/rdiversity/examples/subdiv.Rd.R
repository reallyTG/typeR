library(rdiversity)


### Name: subdiv
### Title: Calculate subcommunity-level diversity
### Aliases: subdiv subdiv,powermean-method subdiv,relativeentropy-method
###   subdiv,metacommunity-method

### ** Examples

# Define metacommunity
pop <- data.frame(a = c(1,3), b = c(1,1))
row.names(pop) <- paste0("sp", 1:2)
pop <- pop/sum(pop)
meta <- metacommunity(pop)

# Calculate subcommunity gamma diversity (takes the power mean)
g <- raw_gamma(meta)
subdiv(g, 0:2)

# Calculate subcommunity beta diversity (takes the relative entropy)
b <- raw_beta(meta)
subdiv(b, 0:2)

# Calculate all measures of subcommunity diversity
subdiv(meta, 0:2)




