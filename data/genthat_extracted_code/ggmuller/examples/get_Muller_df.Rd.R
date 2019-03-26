library(ggmuller)


### Name: get_Muller_df
### Title: Create a data frame from which to create a Muller plot
### Aliases: get_Muller_df

### ** Examples

# by default, all genotypes are included, 
# but one can choose to omit genotypes with max frequency < cutoff:
Muller_df <- get_Muller_df(example_edges, example_pop_df, cutoff = 0.01)

# the genotype names can be arbitrary character strings instead of numbers:
example_edges_char <- example_edges
example_edges_char$Identity <- paste0("foo", example_edges_char$Identity, "bar")
example_edges_char$Parent <- paste0("foo", example_edges_char$Parent, "bar")
example_pop_df_char <- example_pop_df
example_pop_df_char$Identity <- paste0("foo", example_pop_df_char$Identity, "bar")
Muller_df <- get_Muller_df(example_edges_char, example_pop_df_char, cutoff = 0.01)

# the genotype names can also be factors (which is the default for strings in imported data):
example_edges_char$Identity <- as.factor(example_edges_char$Identity)
example_edges_char$Parent <- as.factor(example_edges_char$Parent)
example_pop_df_char$Identity <- as.factor(example_pop_df_char$Identity)
Muller_df <- get_Muller_df(example_edges_char, example_pop_df_char, cutoff = 0.01)

# to see the effect of changing start_positions, compare these two plots:
edges1 <- data.frame(Parent = c(1,2,1), Identity = 2:4)
pop1 <- data.frame(Time = rep(1:4, each = 4), 
                    Identity = rep(1:4, times = 4),
                    Population = c(1, 0, 0, 0, 
                                   2, 2, 0, 0, 
                                   4, 8, 4, 0, 
                                   8, 32, 32, 16))
df0 <- get_Muller_df(edges1, pop1, start_positions = 0)
df1 <- get_Muller_df(edges1, pop1, start_positions = 1)
Muller_plot(df0)
Muller_plot(df1)




