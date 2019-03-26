library(CommT)


### Name: CommT.viz
### Title: Visualize tree distances and ANOVA results
### Aliases: CommT.viz

### ** Examples

  # Load libraries
  #  require(ape)

  # Load input data
    data(post_gt_distrs_BEAST)
    data(post_gt_distrs_starBEAST)

  # Calculate KF distances
    in_data = CommT.kfdist(post_gt_distrs_BEAST, post_gt_distrs_starBEAST)

  # Generate ANOVA legend
    legend_text = CommT.anova(in_data)

  # Generate coordinates for plot
    legend_pos = CommT.legendpos(in_data)

  # Visualize KF distances
    my_plot = CommT.viz(in_data, "my_project", alpha=0.05, legend_text, legend_pos)



