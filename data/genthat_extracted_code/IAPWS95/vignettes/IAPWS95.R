## ---- results = 'asis'---------------------------------------------------
# Entropy Function of Pressure, with Temperature Constant
library(IAPWS95)
library(pander)
# Initial Pressure
p1 <- 10.
# Final Pressure
p2 <- 100.
# Pressure increment
dp <- 10.
# Temperature
T <- 450.
capture.output( Tabs <- spTcteTab(p1, p2, dp, T), file='NUL')
pander::pandoc.table(Tabs)

## ---- results = 'asis'---------------------------------------------------
# Saturation Properties Function of Temperature
library(IAPWS95)
library(pander)
# Initial Temperature
T1 <- 300.
# Final Temperature
T2 <- 400.
# Temperature increment
dT <- 10.
capture.output( TabT <- satTabvT(T1, T2, dT), file='NUL')
pander::pandoc.table(TabT)

## ---- results = 'asis'---------------------------------------------------
# Dynamic Viscosity [ Pa s ]
library(IAPWS95)
# Temperature
T <- 500.
# Density
D <- 838.025
ViscTD(T,D)

# Specific Enthalpy [ kJ kg-1 ]
hTD(T,D)

# Pressure [ MPa ]
pTD(T,D)



## ---- results = 'asis'---------------------------------------------------
# Specific Internal Energy [ kJ kg-1 ]
library(IAPWS95)
# Temperature
T <- 500.
# Pressure
p <- 10.0003858
uTp(T,p)

# Specific Enthalpy [ kJ kg-1 ]
hTp(T,p)


## ---- results = 'asis'---------------------------------------------------
# Error Codes
library(IAPWS95)
library(pander)
capture.output( errorT <- errorCodes, file='NUL')
pander::pandoc.table(errorT)


## ---- fig.show='hold'----------------------------------------------------
library(IAPWS95)
library(ggplot2)
# Initial Temperature
T1 <- 275.
# Final Temperature
T2 <- 647.
# Temperature increment
dT <- 3.
capture.output( Tab <- satTabT(T1, T2, dT), file='NUL')
x1 <- Tab[,6]
x2 <- rev(Tab[,7])
s <- append(x1, x2)
y1 <- Tab[,4]
y2 <- rev(Tab[,5])
h <- append(y1, y2)
# h- Graph
plot(s,h, type = "o", pch=20)
grid()

dados <- as.data.frame(s)
dados$h <- h
ggplot2::ggplot(dados, ggplot2::aes(x=s, y=h)) + ggplot2::geom_line()


