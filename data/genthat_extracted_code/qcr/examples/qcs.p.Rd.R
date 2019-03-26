library(qcr)


### Name: qcs.p
### Title: Function to plot Shewhart xbar chart
### Aliases: qcs.p qcs.p.default qcs.p.qcd

### ** Examples

library(qcr)
data(orangejuice)
str(orangejuice)
attach(orangejuice)

datos.qcd <- qcd(data = orangejuice, var.index = 1, sample.index = 2,
                sizes = size, type.data = "atributte")

res.qcs <- qcs.p(datos.qcd)
summary(res.qcs)
plot(res.qcs)

datos.qcs <- qcs.p(orangejuice[trial,c(1,2)], sizes = orangejuice[trial,3])
plot(datos.qcs)



