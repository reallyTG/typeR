library(RcmdrPlugin.TeachStat)


### Name: calcularResumenDatosTabulados
### Title: Summary statistics for tabulated data
### Aliases: calcularResumenDatosTabulados

### ** Examples


data(cars93)
cortes <- seq(from=1500, to=4250, by=250)
aa <- cut( cars93$Weight, breaks=cortes, dig.lab=4)
ni <- table(aa)
l_inf <- cortes[-length(cortes)]
l_sup <- cortes[-1]
agrup <- data.frame(l_inf,l_sup,ni)
head(agrup)

calcularResumenDatosTabulados(agrup$l_inf, agrup$l_sup, agrup$Freq)
calcularResumenDatosTabulados(agrup$l_inf, agrup$l_sup, agrup$Freq, tabla=TRUE)

bb <- calcularResumenDatosTabulados(agrup$l_inf, agrup$l_sup, agrup$Freq,
                                    statistics=c("mean","mode") )
bb
str(bb)
class(bb$.summary)
class(bb$.table)



