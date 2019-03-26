library(PCPS)


### Name: pcpc.curve.calc
### Title: Curve of phylogenetic signal at metacommunity level
### Aliases: pcpc.curve.calc pcps.curve print.pcpscurve summary.pcpscurve
###   plot.pcpscurve plot.pcpscurve print.pcpscurve summary.pcpscurve
### Keywords: PCPS

### ** Examples


data(flona)
res<-pcps.curve(flona$community, flona$phylo, flona$trait[,1,drop = FALSE], 
       null.model.ts = TRUE, runs = 9)
res
summary(res)
plot(res, draw.model = "ts", type = "b", col = "red")




