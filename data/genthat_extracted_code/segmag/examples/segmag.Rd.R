library(segmag)


### Name: segmag
### Title: Create Segmentation Object
### Aliases: segmag

### ** Examples

# segmentation responses (key presses) of 6 participants watching a movie (30 seconds long)
participant_ids <- factor(c(1,1,1,1,2,2,3,3,3,3,4,4,4,5,5,6,6,6))
time_keypresses <- c(7,12,18,25,12.1,24.9,6.9,10,25.2,29,7.2,12.05,17.5,7.05,25,6.9,16.1,25)

# create segmag object
segmag1 <- segmag(participant_ids, time_keypresses, time_min=0, time_max=30)

## Not run: 
##D # estimate the critical cutoff against an alpha level of 0.05
##D # Note: This is an estimate an will vary slightly against multiple calls of this function
##D #       (variation is the lower the higher n_bootstrap is set)
##D critical_cutoff <- bootstrap_critical_cutoffs(segmag1, 5000, .95)
## End(Not run)
## Don't show: 
critical_cutoff <- 1.623081
## End(Don't show)

# timestamps of significant event boundaries within the movie
eb_times <- get_eb_times(segmag1, critical_cutoff)

plot(segmag1, critical_cutoff, eb_times)




