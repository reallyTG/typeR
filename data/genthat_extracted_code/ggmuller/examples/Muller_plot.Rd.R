library(ggmuller)


### Name: Muller_plot
### Title: Draw a Muller plot of frequencies using ggplot2
### Aliases: Muller_plot

### ** Examples

# include all genotypes:
Muller_df1 <- get_Muller_df(example_edges, example_pop_df)
Muller_plot(Muller_df1)
# omit genotypes with max frequency < 0.1:
Muller_df2 <- get_Muller_df(example_edges, example_pop_df, cutoff = 0.2)
Muller_plot(Muller_df2)
# colour by a continuous variable:
Muller_df1 <- get_Muller_df(example_edges, example_pop_df)
Muller_df1$Val <- as.numeric(Muller_df1$Identity)
Muller_plot(Muller_df1, colour_by = "Val", add_legend = TRUE)




