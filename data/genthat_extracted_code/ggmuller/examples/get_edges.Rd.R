library(ggmuller)


### Name: get_edges
### Title: Extract an adjacency matrix from a larger data frame
### Aliases: get_edges

### ** Examples

edges <- get_edges(example_df)

# extract the adjacency matrix from the data frame:
pop_df <- get_population_df(example_df)

# create data frame for plot:
Muller_df <- get_Muller_df(edges, pop_df)

require(RColorBrewer) # for the palette

# draw plot:
num_cols <- length(unique(Muller_df$RelativeFitness)) + 1
Muller_df$RelativeFitness <- as.factor(Muller_df$RelativeFitness)
Muller_plot(Muller_df, colour_by = "RelativeFitness", 
            palette = rev(colorRampPalette(brewer.pal(9, "YlOrRd"))(num_cols)), 
            add_legend = TRUE)




