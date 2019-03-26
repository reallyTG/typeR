library(multinets)


### Name: layout_multilevel
### Title: Layout for multilevel networks
### Aliases: layout_multilevel

### ** Examples

# Check if the network is multilevel
is_multilevel(linked_sim)

# Generate the layout (x,y) coordinates
l <- layout_multilevel(linked_sim)

# Plot the graph using the layout
plot(linked_sim, layout = l)

# Using Kamada Kawai algorithm
l.kk <- layout_multilevel(linked_sim, layout = igraph::layout_with_kk)

# Plot the graph with the new layout
plot(linked_sim, layout = l.kk)




