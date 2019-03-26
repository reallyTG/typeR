library(kineticF)


### Name: kFsubj
### Title: Plots a subject's kinetic data
### Aliases: kFsubj

### ** Examples

data(Goldmann.demogr, package='kineticF', envir = environment())
data(M0001RGIII4e, package='kineticF', envir = environment())
data(M0001RGI4e, package='kineticF', envir = environment())
data(M0001RGblind, package='kineticF', envir = environment())
test<- kFsubj(obj.name='M0001R', perimeter='G', 
              no.cleaning=TRUE,
              no.kprm=TRUE, no.flip=TRUE)



