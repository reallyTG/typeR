library(ARTool)


### Name: HigginsABC
### Title: Synthetic 2x2x2 Mixed Design Experiment
### Aliases: HigginsABC
### Keywords: datasets

### ** Examples

## Not run: 
##D data(HigginsABC, HigginsABC.art, package="ARTool")
##D 
##D ## run aligned-rank transform and ANOVA on the data
##D m <- art(Y ~ A*B*C + Error(Subject), data=HigginsABC)
##D anova(m)
## End(Not run)



