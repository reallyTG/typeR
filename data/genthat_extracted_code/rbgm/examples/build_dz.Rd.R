library(rbgm)


### Name: build_dz
### Title: Build Atlantis dz Values
### Aliases: build_dz

### ** Examples

## sanity tests
build_dz(-5000)
build_dz(-1500)
##build_dz(300)  ## error
build_dz(0)    ## ok
## data
dd <- c(-4396.49, -2100.84, -4448.81, -411.96, -2703.56, -5232.96, 
       -4176.25, -2862.37, -3795.6, -1024.64, -897.93, -1695.82, -4949.76, 
    -5264.24, -2886.81)
## all values in a matrix for checking
## [zlayers, dd]
dzvals <- sapply(dd, build_dz)
## process into text
f1 <- function(x) sprintf("somelabel,%i,%s", x, paste(build_dz(dd[x]), collapse = ","))
tex1 <- sapply(seq(length(dd)),  f1)
## for example
f2 <- function(x) {
sprintf("morelabel,%i,%s", x, paste(as.integer(build_dz(dd[x])), collapse = ","))
}
tex2 <- sapply(seq(length(dd)),  f2)



