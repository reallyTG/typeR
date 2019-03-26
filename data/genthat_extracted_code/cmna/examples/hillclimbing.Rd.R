library(cmna)


### Name: hillclimbing
### Title: Hill climbing
### Aliases: hillclimbing

### ** Examples

f <- function(x) {
    (x[1]^2 + x[2] - 11)^2 + (x[1] + x[2]^2 - 7)^2
}
hillclimbing(f, c(0,0))
hillclimbing(f, c(-1,-1))
hillclimbing(f, c(10,10))




