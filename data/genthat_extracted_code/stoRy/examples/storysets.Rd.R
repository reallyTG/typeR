library(stoRy)


### Name: storysets
### Title: Storysets objects
### Aliases: storysets
### Keywords: datasets

### ** Examples

#######################################################################
# List all storysets files available in the \pkg{stoRy} package       #
#######################################################################
list.files(system.file("storysets", package = "stoRy"))

#######################################################################
# Load the Star Trek aliens storysets smt file and storysets object   #
#######################################################################
file <- system.file("storysets", "aliens.smt", package = "stoRy")
mystorysets <- storysets$new(file)
print(mystorysets)



