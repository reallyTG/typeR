library(provenance)


### Name: as.acomp
### Title: create an 'acomp' object
### Aliases: as.acomp

### ** Examples

data(Namib)
qfl <- ternary(Namib$PT,c('Q'),c('KF','P'),c('Lm','Lv','Ls'))
plot(qfl,type="QFL.dickinson")
qfl.acomp <- as.acomp(qfl)
## uncomment the next two lines to plot an error
## ellipse using the compositions package: 
# library(compositions)
# ellipses(mean(qfl.acomp),var(qfl.acomp),r=2)



