library(qcr)


### Name: qcs.np
### Title: Function to plot Shewhart np chart
### Aliases: qcs.np qcs.np.default qcs.np.qcd

### ** Examples

library(qcr)
data(orangejuice)
str(orangejuice)
attach(orangejuice)

datos.qcd <- qcd(data = orangejuice, var.index = 1, sample.index = 2,
                sizes = size, type.data = "atributte")

res.qcs <- qcs.np(datos.qcd)
summary(res.qcs)
plot(res.qcs)

datos.qcs <- qcs.np(orangejuice[trial,c(1,2)], sizes = orangejuice[trial,3])
plot(datos.qcs)



