library(biogeo)


### Name: env2stack
### Title: Read environmental variable rasters
### Aliases: env2stack

### ** Examples

fd<-system.file(package="dismo")
foldenv<-file.path(fd,"ex", fsep = .Platform$file.sep)
ev<-env2stack(foldenv, vars = c("bio1","bio12","bio5","bio6"), fext="grd")



