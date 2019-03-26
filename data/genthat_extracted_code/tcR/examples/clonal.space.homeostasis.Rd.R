library(tcR)


### Name: clonal.space.homeostasis
### Title: Clonal space homeostasis.
### Aliases: clonal.space.homeostasis

### ** Examples

## Not run: 
##D data(twb)
##D # Compute summary space of clones, that occupy
##D # [0, .05) and [.05, 1] proportion.
##D clonal.space.homeostasis(twb, c(Low = .05, High = 1)))
##D #        Low (0 < X <= 0.05) High (0.05 < X <= 1)
##D # Subj.A           0.9421980           0.05780198
##D # Subj.B           0.9239454           0.07605463
##D # Subj.C           0.8279270           0.17207296
##D # Subj.D           1.0000000           0.00000000
##D # I.e., for Subj.D sum of all read proportions for clones
##D # which have read proportion between 0 and .05 is equal to 1.
## End(Not run)



