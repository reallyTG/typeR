library(renpow)


### Name: AC power
### Title: AC power in the time and frequency domain
### Aliases: ACpower inst.pow.calc inst.pow.plot inst.pow.leg
###   complex.pow.calc complex.pow.plot complex.pow.tri pf.corr pf.corr.tri
### Keywords: hplot dplot math

### ** Examples


# power resistor
vm=170; R=10
x <- list(c(vm,0),c(vm/R,0))
inst.pow.plot(x)

# power capacitor
w <- 377; v.s <- c(170,0)
C=1000*10^-6
# current response
i.res <- c(v.s[1]*(w*C),v.s[2]+90)
x <- list(v.s,i.res)
inst.pow.plot(x)

# calc complex power
V.s=c(170,10); Z.p=c(10,20)
I.p <- div.polar(V.s,Z.p)
V <- V.s[1]/sqrt(2); I <- I.p[1]/sqrt(2)
theta <- V.s[2]-I.p[2] 
cp <- complex.pow.calc(list(V,I,theta))

# pf correction
P=5; V=240; I=40; pfc=0.9
pf <- P*1000/(V*I)
# call pf correction function
pfcorr <- pf.corr(P,V,pf,pfc)
# visualize
pf.corr.tri(pfcorr)




