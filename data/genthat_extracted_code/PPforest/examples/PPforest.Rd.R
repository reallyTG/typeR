library(PPforest)


### Name: PPforest
### Title: Projection Pursuit Random Forest
### Aliases: PPforest

### ** Examples

#crab example with all the observations used as training

pprf.crab <- PPforest(data = crab, class = 'Type',
 std = FALSE, size.tr = 1, m = 200, size.p = .5, PPmethod = 'LDA' , parallel = TRUE, cores = 2)
pprf.crab




