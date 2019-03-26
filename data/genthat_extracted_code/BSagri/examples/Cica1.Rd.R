library(BSagri)


### Name: Cica1
### Title: Catches of Planthoppers and Leafhoppers
### Aliases: Cica1
### Keywords: datasets

### ** Examples

data(Cica1)

layout(matrix(1:2,ncol=1))

ylim<-range(Cica1[,c("Au_Bonitur","Zs_sweep_netting")])

boxplot(Au_Bonitur ~ Treatment, data=Cica1,
 main= "Aucherrhyncha, visual assessment", ylim=ylim)

boxplot(Zs_sweep_netting ~ Treatment, data=Cica1,
 main="Z.scutellaris, sweep netting", ylim=ylim)





