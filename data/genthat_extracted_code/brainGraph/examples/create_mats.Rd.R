library(brainGraph)


### Name: create_mats
### Title: Create connection matrices for tractography or fMRI data
### Aliases: create_mats

### ** Examples

## Not run: 
##D thresholds <- seq(from=0.001, to=0.01, by=0.001)
##D fmri.mats <- create_mats(f.A, modality='fmri', threshold.by='consensus',
##D   mat.thresh=thresholds, sub.thresh=0.5, inds=inds)
##D dti.mats <- create_mats(f.A, divisor='waytotal', div.files=f.way,
##D   mat.thresh=thresholds, sub.thresh=0.5, inds=inds)
## End(Not run)



