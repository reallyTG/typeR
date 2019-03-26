library(sparr)


### Name: risk
### Title: Spatial relative risk/density ratio
### Aliases: risk rrs

### ** Examples


data(pbc)
pbccas <- split(pbc)$case
pbccon <- split(pbc)$control
h0 <- OS(pbc,nstar="geometric")

# Fixed 
pbcrr1 <- risk(pbccas,pbccon,h0=h0,tolerate=TRUE)

# Asymmetric adaptive
pbcrr2 <- risk(pbccas,pbccon,h0=h0,adapt=TRUE,hp=c(OS(pbccas)/2,OS(pbccon)/2),
               tolerate=TRUE,davies.baddeley=0.05)

# Symmetric (pooled) adaptive
pbcrr3 <- risk(pbccas,pbccon,h0=h0,adapt=TRUE,tolerate=TRUE,hp=OS(pbc)/2,
               pilot.symmetry="pooled",davies.baddeley=0.05)

# Symmetric (case) adaptive; from two existing 'bivden' objects
f <- bivariate.density(pbccas,h0=h0,hp=2,adapt=TRUE,pilot.density=pbccas,
                       edge="diggle",davies.baddeley=0.05,verbose=FALSE) 
g <- bivariate.density(pbccon,h0=h0,hp=2,adapt=TRUE,pilot.density=pbccas,
                       edge="diggle",davies.baddeley=0.05,verbose=FALSE)
pbcrr4 <- risk(f,g,tolerate=TRUE,verbose=FALSE)

par(mfrow=c(2,2))
plot(pbcrr1,override.par=FALSE,main="Fixed")
plot(pbcrr2,override.par=FALSE,main="Asymmetric adaptive")
plot(pbcrr3,override.par=FALSE,main="Symmetric (pooled) adaptive")
plot(pbcrr4,override.par=FALSE,main="Symmetric (case) adaptive") 




