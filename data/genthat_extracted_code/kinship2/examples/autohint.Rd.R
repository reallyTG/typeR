library(kinship2)


### Name: autohint
### Title: Align a pedigree to print well
### Aliases: autohint
### Keywords: genetics

### ** Examples

data(testped1)
ped1 <- with(testped1, pedigree(id, father, mother, sex))
plot(ped1, cex=.7, symbolsize=.7)

# rearrange some founders
temp <- 1:nrow(testped1)
temp[76] <- .1
temp[77] <- .2
temp[74] <- .3
temp[60] <- .4
temp[30] <- temp[8] + .1
temp[65] <- temp[4] + .1
temp[14] <- temp[3] + .1
ped1$hints <- autohint(ped1, temp)
plot(ped1, cex=.7)



