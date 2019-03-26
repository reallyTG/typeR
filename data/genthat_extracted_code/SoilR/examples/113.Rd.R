library(SoilR)


### Name: eCO2
### Title: Soil CO2 efflux from incubation experiments
### Aliases: eCO2
### Keywords: datasets

### ** Examples

head(eCO2)

plot(eCO2mean~Days,data=eCO2,subset=Sample=="HN_T35",col=2)
points(eCO2mean~Days,data=eCO2,subset=Sample=="AK_T25",col=4)
legend("topleft",
       c("HN_T35: temperate forest soil","AK_T25: boreal forest soil"),
       pch=1,col=c(2,4),bty="n")



