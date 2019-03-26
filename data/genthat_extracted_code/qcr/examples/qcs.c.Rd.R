library(qcr)


### Name: qcs.c
### Title: Function to plot Shewhart c chart
### Aliases: qcs.c qcs.c.default qcs.c.qcd

### ** Examples

library(qcr)
data(circuit)
attach(circuit)
str(circuit)
datos <- circuit
datos$sample <- 1:length(datos$x)
str(datos)
sizes <- datos[,2]

datos.qcd <- qcd(data = datos, var.index = 1,sample.index = 2,
                sizes = size, type.data = "atributte")
res.qcs <- qcs.c(datos.qcd)
summary(res.qcs)
plot(res.qcs)




