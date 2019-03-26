library(CommT)


### Name: CommT.anova
### Title: Conduct ANOVA analysis on tree distance matrix
### Aliases: CommT.anova

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



