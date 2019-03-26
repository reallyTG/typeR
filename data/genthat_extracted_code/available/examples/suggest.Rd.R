library(available)


### Name: suggest
### Title: Suggest a package name based on a development package title or
###   description
### Aliases: suggest

### ** Examples

## Not run: 
##D # Default will use the title from the current path.
##D suggest()
##D 
##D # Can also suggest based on the description
##D suggest(field = "Description")
## End(Not run)

# Or by explictly using the text argument
suggest(text =
  "A Package for Displaying Visual Scenes as They May Appear to an Animal with Lower Acuity")



