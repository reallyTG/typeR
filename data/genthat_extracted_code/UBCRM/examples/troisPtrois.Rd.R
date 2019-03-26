library(UBCRM)


### Name: troisPtrois
### Title: Dose escalation with the 3+3 design
### Aliases: troisPtrois

### ** Examples

# Study initialization
data<- CreData(5,c("5 mg/m2","7 mg/m2","10 mg/m2","15 mg/m2","20 mg/m2"))
data

# Three patients are treated at the dose 1, without any observed DLT:
data<- updata(data,lastdose=1,npt=3,ndlt=0)
data

# 3+3 design
troisPtrois(data,lastdose=1)



