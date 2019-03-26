library(ggforce)


### Name: geom_parallel_sets
### Title: Create Parallel Sets diagrams
### Aliases: geom_parallel_sets stat_parallel_sets stat_parallel_sets_axes
###   geom_parallel_sets_axes geom_parallel_sets_labels

### ** Examples

data <- reshape2::melt(Titanic)
data <- gather_set_data(data, 1:4)

ggplot(data, aes(x, id = id, split = y, value = value)) +
  geom_parallel_sets(aes(fill = Sex), alpha = 0.3, axis.width = 0.1) +
  geom_parallel_sets_axes(axis.width = 0.1) +
  geom_parallel_sets_labels(colour = 'white')



