library(M3)


### Name: get.proj.info.M3
### Title: Obtain information about the projection used in the Models3 file
### Aliases: get.proj.info.M3
### Keywords: IO

### ** Examples

## Find the path to a demo file on lambert conic conformal projection.
lcc.file <- system.file("extdata/ozone_lcc.ncf", package="M3")
## Get string with projection information, using previous value for
## the earth's radius.
get.proj.info.M3(lcc.file, earth.radius=6370997)

## Find the path to a demo file on polar stereographic projection.
polar.file <- system.file("extdata/surfinfo_polar.ncf", package="M3")
## Get string with projection information.
get.proj.info.M3(polar.file)



