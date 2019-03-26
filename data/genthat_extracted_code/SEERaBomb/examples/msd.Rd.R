library(SEERaBomb)


### Name: msd
### Title: Mortality vs years Since Diagnosis
### Aliases: msd
### Keywords: IO

### ** Examples

## Not run: 
##D library(SEERaBomb)
##D load("~/data/SEER/mrgd/cancDef.RData") #loads in canc
##D lu=canc%>%filter(cancer=="lung")
##D lu=lu%>%mutate(status=as.numeric(COD>0))%>%select(yrdx,agedx,sex,surv,status) 
##D lu=lu%>%mutate(surv=round((surv+0.5)/12,3))#convert surv to years
##D 
##D # library(demography)
##D # d=hmd.mx("USA", "username", "password") #make an account and put your info in here
##D # mrt=d$rate
##D # save(mrt,file="~/data/usMort/mrt.RData")
##D load("~/data/usMort/mrt.RData"); object.size(mrt)# 250kb
##D brks=c(0,0.5,3,6,10,15,20,25)    
##D (dlu=msd(lu,mrt,brkst=brks))
## End(Not run)



