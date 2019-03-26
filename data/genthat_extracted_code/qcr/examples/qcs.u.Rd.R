library(qcr)


### Name: qcs.u
### Title: Function to plot Shewhart u chart
### Aliases: qcs.u qcs.u.default qcs.u.qcd

### ** Examples


data(pcmanufact)
attach(pcmanufact)
str(pcmanufact)
datos <- pcmanufact
datos$sample <- 1:length(datos$x)
str(datos)
sizes <- datos[,2]

datos.qcd <- qcd(data = datos, var.index = 1,sample.index = 2,
                sizes = sizes, type.data = "atributte")

res.qcs <- qcs.u(datos.qcd)
summary(res.qcs)
plot(res.qcs)




