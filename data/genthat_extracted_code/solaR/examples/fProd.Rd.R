library(solaR)


### Name: C_fProd
### Title: Performance of a PV system
### Aliases: fProd
### Keywords: utilities

### ** Examples

inclin=data.frame(Gef=c(200,400,600,800,1000),Ta=25)

#using default values
fProd(inclin)

#Using a matrix for Ki (voltage dependence)
inv1=list(Ki=rbind(c(-0.00019917, 7.513e-06, -5.4183e-09),
c(0.00806, -4.161e-06, 2.859e-08),
c(0.02118, 3.4002e-05, -4.8967e-08)))

fProd(inclin, inverter=inv1)

#Voltage limits of the inverter
inclin=data.frame(Gef=800,Ta=30)
gen1 = list(Nms = 10, Nmp = 11)

prod=fProd(inclin,generator=gen1)
print(prod)

with(prod,Vdc*Idc/(Vmpp*Impp))



