library(slam)


### Name: options
### Title: Options for the 'slam' package
### Aliases: slam_options
### Keywords: math

### ** Examples

## save defaults
.slam_options <- slam_options()
.slam_options

slam_options("max_dense", 2^25)
slam_options("max_dense")

## reset
slam_options("max_dense", .slam_options$max_dense)



