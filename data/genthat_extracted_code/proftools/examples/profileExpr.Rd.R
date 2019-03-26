library(proftools)


### Name: profileExpr
### Title: Read Rprof Profile Data
### Aliases: profileExpr
### Keywords: programming utilities

### ** Examples

## This defines the function rw()
source(system.file("samples", "rw.R", package="proftools"))

## Execute the function and collect profile data
pd <- profileExpr(rw(200000))

## Examine the profiel data
funSummary(pd)
callSummary(pd)
hotPaths(pd)
srcSummary(pd)
plotProfileCallGraph(pd)



