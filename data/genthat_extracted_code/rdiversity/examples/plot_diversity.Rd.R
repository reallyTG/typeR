library(rdiversity)


### Name: plot_diversity
### Title: Plot diversity
### Aliases: plot_diversity

### ** Examples

# Define metacommunity
pop <- data.frame(a = c(1,3), b = c(1,1))
row.names(pop) <- paste0("sp", 1:2)
pop <- pop/sum(pop)
meta <- metacommunity(pop)

# Calculate subcommunity beta diversity (takes the relative entropy)
b <- raw_beta(meta)
res <- subdiv(b, 0:2)
plot_diversity(res)

# Calculate all measures of subcommunity diversity
res <- subdiv(meta, 0:2)
plot_diversity(res)

# Try a single population
pop <- c(1,3,4)
meta <- metacommunity(pop)
res <- meta_gamma(meta, 0:2)
plot_diversity(res)

# Calculate all measures of metacommunity diversity
res <- metadiv(meta, 0:2)
plot_diversity(res)




