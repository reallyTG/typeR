library(modygliani)


### Name: modygliani
### Title: modygliani: MOlecular DYnamics GLobal ANalysis
### Aliases: modygliani

### ** Examples

## fitting and comparison of four different MD trajectories
names <- c("fe_CG","co_CG","ni_CG","zn_CG") # file names
colors<- c("gray0","gray25","gray50","gray75")
path <-"inst/extdata/"
modygliani(path, names, 0, 0, 8, -200, 250, 0, "Modygliani example on NAMD trajectories", colors)



