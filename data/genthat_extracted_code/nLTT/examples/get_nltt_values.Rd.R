library(nLTT)


### Name: get_nltt_values
### Title: Collects the nLTT values of all phylogenies in the
###   melted/uncast/long form
### Aliases: get_nltt_values

### ** Examples

  library(ape)
  library(ggplot2)
  library(nLTT)

  # Create some random phylogenies
  phylogeny1 <- rcoal(10)
  phylogeny2 <- rcoal(20)
  phylogeny3 <- rcoal(30)
  phylogeny4 <- rcoal(40)
  phylogeny5 <- rcoal(50)
  phylogeny6 <- rcoal(60)
  phylogeny7 <- rcoal(70)
  phylogenies <- c(phylogeny1, phylogeny2, phylogeny3,
    phylogeny4, phylogeny5, phylogeny6, phylogeny7
  )

  # Obtain the nLTT values
  dt <- 0.2
  nltt_values <- get_nltt_values(phylogenies, dt = dt)

  # Check properties of nltt_values
  testit::assert(names(nltt_values) == c("id", "t", "nltt"))
  nltt_values_per_phylogeny <- (1 + (1 / dt))
  n_phylogenies <- length(phylogenies)
  testit::assert(nrow(nltt_values)
    == nltt_values_per_phylogeny * n_phylogenies
  )

  # Plot the phylognies, where the individual nLTT values are visible
  qplot(t, nltt, data = nltt_values, geom = "point",
    ylim = c(0,1),
    main = "Average nLTT plot of phylogenies", color = id, size = I(0.1)
  ) + stat_summary(
    fun.data = "mean_cl_boot", color = "red", geom = "smooth"
  )

  # Plot the phylognies, where the individual nLTT values are omitted
  qplot(
    t, nltt, data = nltt_values, geom = "blank", ylim = c(0,1),
    main = "Average nLTT plot of phylogenies"
  ) + stat_summary(
    fun.data = "mean_cl_boot", color = "red", geom = "smooth"
  )



