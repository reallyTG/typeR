library(renpow)


### Name: magnetic circuits
### Title: Magnetic circuit calculations
### Aliases: magnetic.circuits inductor reluctance flux
### Keywords: hplot dplot math

### ** Examples


# Chapter 5 simple inductor
mu=1000; l=1*10^-2; A=pi*(1*10^-3)^2
reluc <- reluctance(x=list(c(mu,l,A)))
reluc$prnt
ind <- inductor(x=list(N=159,rel=reluc$rel))
ind$prnt

# Chapter 10 air gaped inductor
mucore=1000; lcore=6*10^-2; Acore=1*10^-4
mugap=1; lgap=1*10^-3; Agap <- Acore
reluc <- reluctance(x=list(c(mucore,lcore,Acore),c(mugap,lgap,Agap)))
reluc$prnt

rel.eq <- reluc$rel[1]+reluc$rel[2] 
ind <- inductor(x=list(N=100,rel=rel.eq))
ind$prnt

magckt <- flux(x=list(N=10,i=1,rel=rel.eq))
magckt$prnt

magckt <- flux(x=list(N=10,i=1,r=reluc$r[2]))
magckt$prnt




