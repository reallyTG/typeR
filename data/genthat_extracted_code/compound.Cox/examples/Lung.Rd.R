library(compound.Cox)


### Name: Lung
### Title: Survival data for patients with non-small-cell lung cancer.
### Aliases: Lung
### Keywords: datasets gene expression lung cancer

### ** Examples

data(Lung)
Lung[1:3,] ## show the first 3 samples ## 

## The five-gene signature in Chen et al. (2007) ##
temp=Lung[,"train"]==TRUE
t.vec=Lung[temp,"t.vec"]
d.vec=Lung[temp,"d.vec"]
coxph(Surv(t.vec,d.vec)~Lung[temp,"ERBB3"])
coxph(Surv(t.vec,d.vec)~Lung[temp,"LCK"])
coxph(Surv(t.vec,d.vec)~Lung[temp,"DUSP6"])
coxph(Surv(t.vec,d.vec)~Lung[temp,"STAT1"])
coxph(Surv(t.vec,d.vec)~Lung[temp,"MMD"])



