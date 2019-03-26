library(BSagri)


### Name: Cica2
### Title: Catches of Planthoppers and Leafhoppers
### Aliases: Cica2
### Keywords: datasets

### ** Examples

data(Cica2)


# A comparison of the treatments:

layout(matrix(1:4,ncol=4))

ylim<-range(Cica2[,c("Au_Bonitur","Zs_sweep_netting", "Zs_yellow_traps", "Zs_stick_traps")])

boxplot(Au_Bonitur ~ Treatment, data=Cica2,
 main= "Aucherrhyncha, visual assessment", ylim=ylim, horizontal=TRUE, las=1)

boxplot(Zs_sweep_netting ~ Treatment, data=Cica2,
 main="Z.scutellaris, sweep netting", ylim=ylim, horizontal=TRUE, las=1)

boxplot(Zs_yellow_traps ~ Treatment, data=Cica2,
 main="Z.scutellaris, yellow traps", ylim=ylim, horizontal=TRUE, las=1)

boxplot(Zs_stick_traps ~ Treatment, data=Cica2,
 main="Z.scutellaris, sticky traps", ylim=ylim, horizontal=TRUE, las=1)

# A comparison of sampling methods:

pairs(Cica2[,c("Au_Bonitur","Zs_sweep_netting", "Zs_yellow_traps", "Zs_stick_traps")])




