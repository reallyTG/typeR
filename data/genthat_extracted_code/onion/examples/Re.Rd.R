library(onion)


### Name: Re
### Title: Octonion components
### Aliases: Re Im i j k l il jl kl Re.octonion Im.octonion i.octonion
###   j.octonion k.octonion l.octonion il.octonion jl.octonion kl.octonion
###   Re.quaternion Im.quaternion i.quaternion j.quaternion k.quaternion
###   Re<- Im<- i<- j<- k<- l<- il<- jl<- kl<- Re<-.octonion Im<-.octonion
###   i<-.octonion j<-.octonion k<-.octonion l<-.octonion il<-.octonion
###   jl<-.octonion kl<-.octonion Re<-.quaternion Im<-.quaternion
###   i<-.quaternion j<-.quaternion k<-.quaternion Im.default Re.default
###   get.comp get.comp.onion set.comp<- set.comp<-.onion
###   set.comp<-.octonion set.comp<-.quaternion
### Keywords: misc

### ** Examples

x <- octonion(Re=1,il=1:3,j=3:1)
Re(x)
kl(x) <- 1000



