library(mousetrap)


### Name: mousetrap
### Title: Process and analyze mouse-tracking data
### Aliases: mousetrap mousetrap-package

### ** Examples

## Not run: 
##D KH2017 <- mt_import_mousetrap(subset(KH2017_raw,correct==1))
##D KH2017 <- mt_remap_symmetric(KH2017)
##D KH2017 <- mt_align_start(KH2017)
## End(Not run)

KH2017 <- mt_time_normalize(KH2017)
KH2017 <- mt_measures(KH2017)

mt_aggregate(
  KH2017, use="measures",
  use_variables=c("MAD", "AD"),
  use2_variables="Condition",
  subject_id="subject_nr"
)

mt_plot_aggregate(KH2017,
  use="tn_trajectories",
  x="xpos", y="ypos", color="Condition",
  subject_id="subject_nr"
)

## Not run: 
##D mt_plot(KH2017,
##D   use="tn_trajectories",
##D   x="xpos", y="ypos", color="Condition"
##D )
## End(Not run)




