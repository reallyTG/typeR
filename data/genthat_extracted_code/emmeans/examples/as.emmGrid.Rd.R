library(emmeans)


### Name: as.emmGrid
### Title: Convert to and from 'emmGrid' objects
### Aliases: as.emmGrid as.list.emmGrid

### ** Examples

pigs.lm <- lm(log(conc) ~ source + factor(percent), data = pigs)
pigs.sav <- as.list(ref_grid(pigs.lm))

pigs.anew <- as.emmGrid(pigs.sav)
emmeans(pigs.anew, "source")

## Not run: 
##D ## Convert an entire workspace saved from an old **lsmeans** session
##D a.problem <- lsmeans::lsmeans(pigs.lm, "source")
##D #- Now global env contains at least two ref.grid and lsmobj objects,
##D #- and the "lsmeans" namespace is loaded
##D emmeans:::convert_workspace()
##D class(a.problem)
##D "lsmeans" %in% loadedNamespaces()
##D #- It's all better now
## End(Not run)



