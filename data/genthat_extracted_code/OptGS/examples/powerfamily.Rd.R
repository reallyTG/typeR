library(OptGS)


### Name: powerfamily
### Title: Finding extended power-family group-sequential designs
### Aliases: powerfamily

### ** Examples

##Find a three-stage design that has shape parameters -0.5 and 0.5.
threestagedesign=powerfamily(J=3,futility=-0.5,efficacy=0.5) 
plot(threestagedesign)



