library(wrapr)


### Name: restrictToNameAssignments
### Title: Restrict an alias mapping list to things that look like name
###   assignments
### Aliases: restrictToNameAssignments

### ** Examples


alias <- list(region= 'east', str= "'seven'")
aliasR <- restrictToNameAssignments(alias)
print(aliasR)





