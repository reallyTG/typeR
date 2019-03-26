library(FloodMapper)


### Name: FM.animate
### Title: Create An Animation for An Existing Model Run
### Aliases: FM.animate

### ** Examples

## Load FloodMapper package
library(FloodMapper)

s_return <- NA

## Assume that the current model run with a name of "Lafayette_1km" 
## has been completed successfully, you can run the following
## command to create an animation in *.gif format.
## No test: 
    s_return <- FM.animate("Lafayette_1km", workdir = tempdir())
## End(No test)

## Check if there are any errors
if (!is.na(s_return)) {
    if (s_return != "") {
        cat("Creating animation is failed because of the following error:\n")
        cat(s_return)
    } else {
        cat("Creating animation is successful!\n")
    }
}



