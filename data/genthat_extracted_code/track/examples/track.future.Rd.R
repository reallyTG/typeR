library(track)


### Name: track.future
### Title: Potential future features of the track package
### Aliases: track.future
### Keywords: data

### ** Examples

# Example (transcript shown above) of how subset-assignment
# results in two retrievals when the object is an active binding.
f <- local( {
    x <- 1
    function(v) {
       if (missing(v)) {
           cat("get\n")
       } else {
           cat("set\n")
           x <<- v
       }
       x
    }
})
makeActiveBinding("X", f, .GlobalEnv)
bindingIsActive("X", .GlobalEnv)
X
X <- 2
X
X[1]
X[2] <- 1 # 'X' is fetched twice
X



