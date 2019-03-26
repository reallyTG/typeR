library(nat.templatebrains)


### Name: regtemplate
### Title: Get or set the registration template space in which an object
###   lives
### Aliases: regtemplate regtemplate<-

### ** Examples

## Not run: 
##D library(nat.flybrains)
##D kcs3=kcs20[1:3]
##D regtemplate(kcs3)=FCWB
##D regtemplate(kcs3)
##D 
##D kcs3m=mirror_brain(kcs3, brain=regtemplate(kcs20))
##D plot3d(kcs3, col='red')
##D plot3d(kcs3m, col='green')
## End(Not run)



