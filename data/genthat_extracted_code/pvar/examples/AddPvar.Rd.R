library(pvar)


### Name: AddPvar
### Title: Addition of p-variation
### Aliases: AddPvar

### ** Examples

### creating two pvar objects:
x = rwiener(1000)
PV1 = pvar(x[1:500], 2)
PV2 = pvar(x[500:1000], 2)

layout(matrix(c(1,3,2,3), 2, 2))
plot(PV1)
plot(PV2)
plot(AddPvar(PV1, PV2))
layout(1)

### AddPvar(PV1, PV2) is eqivavalent to PV1 + PV2
IsEqualPvar(AddPvar(PV1, PV2), PV1 + PV2)



