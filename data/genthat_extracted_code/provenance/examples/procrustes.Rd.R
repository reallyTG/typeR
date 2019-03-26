library(provenance)


### Name: procrustes
### Title: Generalised Procrustes Analysis of provenance data
### Aliases: procrustes

### ** Examples

data(Namib)
gpa <- procrustes(Namib$DZ,Namib$HM)
plot(gpa)



