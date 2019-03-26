library(inlabru)


### Name: gg
### Title: ggplot2 geomes for inlabru related objects
### Aliases: gg

### ** Examples


# Load Gorilla data

data(gorillas, package = "inlabru")

# Invoke ggplot and add geomes for the Gorilla nests and the survey boundary

ggplot() + gg(gorillas$boundary) + gg(gorillas$nests)



