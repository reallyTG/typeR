library(lmerTest)


### Name: plot.step_list
### Title: Plot LS-means for Backward Reduced Model
### Aliases: plot.step_list
### Keywords: internal

### ** Examples


## Not run: 
##D # Fit example model:
##D tv <- lmer(Sharpnessofmovement ~ TVset * Picture +
##D              (1 | Assessor:TVset) + (1 | Assessor:Picture) +
##D              (1 | Assessor:Picture:TVset) + (1 | Repeat) + (1 | Repeat:Picture) +
##D              (1 | Repeat:TVset) + (1 | Repeat:TVset:Picture) + (1 | Assessor),
##D            data = TVbo)
##D 
##D # Backward reduce the model:
##D (st <- step(tv)) # takes ~10 sec to run
##D 
##D # Pairwise comparisons of LS-means for Picture and TVset:
##D   plot(st, which=c("Picture", "TVset"), pairwise = TRUE)
## End(Not run)




