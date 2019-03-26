library(crunch)


### Name: conditionalTransform
### Title: Conditional transformation
### Aliases: conditionalTransform

### ** Examples

## Not run: 
##D 
##D ds$cat_opinion <- conditionalTransform(pet1 == 'Cat' ~ Opinion1,
##D                                        pet2 == 'Cat' ~ Opinion2,
##D                                        pet3 == 'Cat' ~ Opinion3,
##D                                        data = ds,
##D                                        name = "Opinion of Cats")
## End(Not run)



