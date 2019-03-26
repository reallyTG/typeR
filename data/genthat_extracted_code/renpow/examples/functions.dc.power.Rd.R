library(renpow)


### Name: DC circuits
### Title: DC circuits and power calculations
### Aliases: DCcircuits resistor ivplane diode vsource isource PVcell
###   PVcell.plot eff.pow transient fuel.cell
### Keywords: hplot dplot math

### ** Examples


# from Chapter 3
# resistors
V <- seq(-0.2,1,0.01) # volts
x <- resistor(V,R=1)
ivplane(x)

# diode
V <- seq(-0.1,0.6,0.01) # volts
x <- diode(V)
ivplane(x)

# voltage source
x <- vsource(Voc=24,Rs=1)
ivplane(x)
# current source
x <- isource(Isc=20,Rp=1)
ivplane(x)

# PV cell
x <- list(I0.A=1, Isc.A=40, Area=100, Rs=0.05, Rp=1, Light=1) 
# units: I0.A pA/cm2 Isc.A mA/cm2 Area cm2 Rs  ohm Rp  ohm
X <- PVcell(x)
ivplane(X,x0=TRUE,y0=TRUE)

# efficiency of power transfer
x <- list(Rth=1,Voc=24)
eff.pow(x)

# from Chapter 5
# RC circuit transient
R=0.2;C=1 # Mohm and uF
transient(ys=12,tau=R*C,ylabel="Vc(t) [V]",yslabel="Vs [V]") 

# RL circuit transient
R=20;L=1; # kohm and mH
transient(ys=12/R,tau=L/R,ylabel="iL(t) [A]",yslabel="Vs/R [V]") 

# Chapter 6 fuel cells
x <- list(area.cm2=15,Rload.ohm=NA)
fuel.cell(x)
x <- list(area.cm2=15,Rload.ohm=0.5)
fuel.cell(x)




