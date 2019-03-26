library(renpow)


### Name: thermo paths
### Title: Thermodynamic paths and cycles
### Aliases: thermodynamics cpcv.cal RefCoefAir cp.cv fcp fcpcv fcv fpv
###   simpson simpson.pv path.calc path.summary isochor isobar adiabat
###   isotherm phase path.lines path.cycles path.cycles.summary
### Keywords: hplot dplot math

### ** Examples


# heat capacities at a given temperature, say 100C
cp.cv(TC=100)

# cv at the middle of a range of temperature 
cp.cv(TC=(323+25)/2)$cv

# arguments: V(l), P(bar), T(C), n(mol), M(g/mol)
# default n=1,M=28.9
# example specify V and P
x <- list(V=c(24.78,NA),P=c(1,2),path='isochor',lab=c("1","2"))
y <- path.calc(x)
path.summary(y)

# specify volume and calculate pressure
x <- list(V=c(24.78,34.78),P=c(1,NA),path='isobar',lab=c("3","4"))
y <- path.calc(x)
path.summary(y)

# example specify V and T visualize the path
x <- list(V=c(10,30),T=c(30,NA),path='isotherm',lab=c("1","2"))
path.lines(x)

# visualize two paths
x1 <- list(V=c(24.78,NA),P=c(1,2),path='isochor',lab=c("1","2"))
x2 <- list(V=c(24.78,34.78),P=c(1,NA),path='isobar',lab=c("3","4"))
path.lines(list(x1,x2))

# visualize two paths and shade in between curves
x1 <- list(V=c(10,30),T=c(200,200),path='isotherm',lab=c("3","4"))
x2 <- list(V=c(10,30),T=c(30,30),path='isotherm',lab=c("1","2"))
x <- list(x1,x2)
path.lines(x,shade.between=TRUE)

# carnot cycle
x <- list(TH=200,TL=30,V1=20,V4=40,cty='carnot')
y <- path.cycles(x,shade.cycle=TRUE)




