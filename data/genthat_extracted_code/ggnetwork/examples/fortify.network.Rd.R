library(ggnetwork)


### Name: fortify.network
### Title: Fortify method for networks of class 'network'
### Aliases: fortify.network

### ** Examples

if (require(ggplot2) && require(network)) {

  # source: ?network::flo
  data(flo)

  # data example
  ggnetwork(flo)

  # plot example
  ggplot(ggnetwork(flo), aes(x, y, xend = xend, yend = yend)) +
    geom_edges(alpha = 0.5) +
    geom_nodes(size = 12, color = "white") +
    geom_nodetext(aes(label = vertex.names), fontface = "bold") +
    theme_blank()

  # source: ?network::emon
  data(emon)

  # data example
  ggnetwork(emon[[1]], layout = "target", niter = 100)

  # data example with edge weights
  ggnetwork(emon[[1]], layout = "kamadakawai", weights = "Frequency")

  # plot example with straight edges
  ggplot(ggnetwork(emon[[1]], layout = "kamadakawai", arrow.gap = 0.025),
         aes(x, y, xend = xend, yend = yend)) +
    geom_edges(aes(color = Frequency),
               arrow = arrow(length = unit(10, "pt"), type = "closed")) +
    geom_nodes(aes(size = Formalization)) +
    scale_color_gradient(low = "grey50", high = "tomato") +
    scale_size_area(breaks = 1:3) +
    theme_blank()

  # plot example with curved edges
  ggplot(ggnetwork(emon[[1]], layout = "kamadakawai", arrow.gap = 0.025),
         aes(x, y, xend = xend, yend = yend)) +
    geom_edges(aes(color = Frequency), curvature = 0.1,
               arrow = arrow(length = unit(10, "pt"), type = "open")) +
    geom_nodes(aes(size = Formalization)) +
    scale_color_gradient(low = "grey50", high = "tomato") +
    scale_size_area(breaks = 1:3) +
    theme_blank()

  # facet by edge attribute
  ggplot(ggnetwork(emon[[1]], arrow.gap = 0.02, by = "Frequency"),
         aes(x, y, xend = xend, yend = yend)) +
    geom_edges(arrow = arrow(length = unit(5, "pt"), type = "closed")) +
    geom_nodes() +
    theme_blank() +
    facet_grid(. ~ Frequency, labeller = label_both)

  # user-provided layout
  ggplot(ggnetwork(emon[[1]], layout = matrix(runif(28), ncol = 2)),
         aes(x, y, xend = xend, yend = yend)) +
    geom_edges(arrow = arrow(length = unit(5, "pt"), type = "closed")) +
    geom_nodes() +
    theme_blank()

}



