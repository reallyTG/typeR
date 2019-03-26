library(adehabitatLT)


### Name: which.ltraj
### Title: Identify Relocations Fullfilling a Condition in an Object of
###   Class "ltraj"
### Aliases: which.ltraj
### Keywords: programming

### ** Examples

data(puechcirc)
puechcirc

## Identifies the relocations for which time lag is
## upper than one hour
which.ltraj(puechcirc, "dt>3600")
puechcirc[burst="CH930824"][[1]][27:28,]


## Identifies the speed between successive
## relocations upper than 0.8 meters/second
which.ltraj(puechcirc, "dist/dt > 0.8")

## This is the case for example for the
## relocations #28, 58, 59 and 60 of "CH930824"
puechcirc[burst="CH930824"][[1]][c(28,58,59,60),]




