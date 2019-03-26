library(renpow)


### Name: AC-DC power electronics
### Title: AC-DC and DC-AC in the time domain
### Aliases: AC.DC.AC rectifier ac.plot.rect inverter
### Keywords: hplot dplot math

### ** Examples


# rectified wave
v.AC <- list(c(170,0))
v.t <- waves(v.AC,nc=4) 
V.t <- rectifier(v.t)
ac.plot.rect(V.t)

# inverter
x <- list(f=60,vin=170,nc=2) 
inverter(x)




