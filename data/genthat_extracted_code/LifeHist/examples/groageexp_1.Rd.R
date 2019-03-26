library(LifeHist)


### Name: groageexp
### Title: Exploratory Growth Modeling with Age and Length Data
### Aliases: groageexp
### Keywords: ~models

### ** Examples

#Schnute - Normal
data(ksbream)
KSBream.AgeLen <- as.GroAgeData(x=ksbream,
                                sex="Total",
                                maleskey=1,
                                femaleskey=2,
                                coldate=1,
                                colsex=9,
                                colage=11,
                                collen=2,
                                colbw=5,
                                colliver=7,
                                colgonad=8,
                                lentype="Total",
                                unitsage="Years",
                                unitslen="mm",
                                unitsbw="g",
                                unitsliver="g",
                                unitsgonad="g",
                                spec="KSBream")
#par ini
l1.f  <- 175
a1.f  <- 1
mu.f  <- 250
g1.f  <- 0.15
g2.f  <- 0.1
l1.m  <- 175
a1.m  <- 1
mu.m  <- 210
g1.m  <- 0.25
g2.m  <- 0.1
psi.f <- 0.5
psi.m <- 0.45
par.ini <- log(c(l1.f,a1.f,mu.f,g1.f,g2.f,l1.m,a1.m,mu.m,g1.m,g2.m,psi.f,psi.m))
KSBream.AgeLen.exp <- groageexp(x=KSBream.AgeLen,
                                unsex.action="split",
                                m="schnute1",
                                par=par.ini,
                                distr="normal")
plot(KSBream.AgeLen.exp)



