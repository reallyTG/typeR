library(MBESS)


### Name: vit
### Title: Visualize individual trajectories
### Aliases: vit
### Keywords: hplot device dynamic

### ** Examples

## Not run: 
##D data(Gardner.LD)
##D 
##D # Although many options are possible, a simple call to
##D # 'vit' is of the form:
##D # vit(id="ID", occasion= "Trial", score= "Score", Data=Gardner.LD)
##D 
##D # Now color is conditional on group membership.
##D # vit(id="ID", occasion= "Trial", score="Score", Data=Gardner.LD, 
##D # group="Group")
##D 
##D # Now randomly selects 50##D 
##D # vit(id="ID", occasion= "Trial", score="Score", Data=Gardner.LD, 
##D # pct.rand=50, group="Group")
##D 
##D # Specified individuals are plotted (by group)
##D # vit(id="ID", occasion= "Trial", score="Score", Data=Gardner.LD, 
##D # subset.ids=c(1, 4, 8, 13, 17, 21), group="Group")
##D 
##D # Now colors for groups are changed .
##D # vit(id="ID", occasion= "Trial", score="Score", Data=Gardner.LD, 
##D # group="Group",subset.ids=c(1, 4, 8, 13, 17, 21), col=c("Green", "Blue"))
##D 
##D # Now each individual specified is plotted separately.
##D # vit(id="ID", occasion= "Trial", score="Score", Data=Gardner.LD, 
##D # group="Group",subset.ids=c(1, 4, 8, 13, 17, 21), col=c("Green", "Blue"),
##D # All.in.One=FALSE)
## End(Not run)



