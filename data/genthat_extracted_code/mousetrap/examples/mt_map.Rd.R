library(mousetrap)


### Name: mt_map
### Title: Map trajectories to prototypes.
### Aliases: mt_map

### ** Examples

# Spatialize trajectories
KH2017 <- mt_spatialize(KH2017)

# Map trajectories onto standard prototype set
KH2017 <- mt_map(KH2017,
  use="sp_trajectories")


# Plot prototypes
mt_plot(mt_prototypes,facet_col="mt_id") + 
  ggplot2::facet_grid(.~factor(mt_id,levels=unique(mt_id)))

# Plot trajectories per assigned prototype
mt_plot(KH2017,use="sp_trajectories",
  use2="prototyping",facet_col="prototype_label")


# Map trajectories onto reduced prototype set
KH2017 <- mt_map(KH2017,
  use="sp_trajectories",
  prototypes=mt_prototypes[c("straight","curved","cCoM"),,],
  save_as="prototyping_red")


# Map trajectories onto extended prototype set

# Add additional prototypes
mt_prototypes_ext <- mt_add_trajectory(mt_prototypes,
   xpos = c(0,1,-1,1,-1), ypos = c(0,1.5,1.5,1.5,1.5), id = "dCoM3"
)
mt_prototypes_ext <- mt_add_trajectory(mt_prototypes_ext,
   xpos = c(0,0,-1), ypos = c(0,1.5,1.5), id = "neutral"
)

# Map trajectories
KH2017 <- mt_map(KH2017,
  use="sp_trajectories", prototypes=mt_prototypes_ext,
  save_as="prototyping_ext")





