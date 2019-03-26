library(CommT)


### Name: CommT.kfdist
### Title: Calculate the tree distance metric
### Aliases: CommT.kfdist

### ** Examples

  # Load libraries
  #  require(ape)

  # Load input data
    data(post_gt_distrs_BEAST)
    data(post_gt_distrs_starBEAST)
    
  # Calculate KF distances
    in_data = CommT.kfdist(post_gt_distrs_BEAST, post_gt_distrs_starBEAST)



