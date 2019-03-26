library(ZOIP)


### Name: rZOIP
### Title: ZOIP Distribution
### Aliases: rZOIP

### ** Examples

library(ZOIP)
a1<-rZOIP(n=1000, mu = 0.2, sigma = 0.5, p0 = 0.2, p1 = 0.2,family='R-S')
a2<-rZOIP(n=1000, mu = 0.2, sigma = 3, p0 = 0.2, p1 = 0.2,family='F-C')
a3<-rZOIP(n=1000, mu = 0.6, sigma = 2.4, p0 = 0.2, p1 = 0.2,family='Original')
system.time(a4<-rZOIP(n=10, mu = 0.2, sigma = 3, p0 = 0.2, p1 = 0.2,family='Simplex'))

plot(density(a1))
plot(density(a2))
plot(density(a3))
plot(density(a4))

a1<-rZOIP(n=1000, mu = 0.2, sigma = 0.5, p0 = 0.2, p1 = 0,family='R-S')
a2<-rZOIP(n=1000, mu = 0.2, sigma = 3, p0 = 0.2, p1 = 0,family='F-C')
a3<-rZOIP(n=1000, mu = 0.6, sigma = 2.4, p0 = 0.2, p1 = 0,family='Original')
system.time(a4<-rZOIP(n=10, mu = 0.2, sigma = 3, p0 = 0.2, p1 = 0,family='Simplex'))

plot(density(a1))
plot(density(a2))
plot(density(a3))
plot(density(a4))

a1<-rZOIP(n=1000, mu = 0.2, sigma = 0.5, p0 = 0, p1 = 0.2,family='R-S')
a2<-rZOIP(n=1000, mu = 0.2, sigma = 3, p0 = 0, p1 = 0.2,family='F-C')
a3<-rZOIP(n=1000, mu = 0.6, sigma = 2.4, p0 = 0, p1 = 0.2,family='Original')
system.time(a4<-rZOIP(n=10, mu = 0.2, sigma = 3, p0 = 0, p1 = 0.2,family='Simplex'))

plot(density(a1))
plot(density(a2))
plot(density(a3))
plot(density(a4))



