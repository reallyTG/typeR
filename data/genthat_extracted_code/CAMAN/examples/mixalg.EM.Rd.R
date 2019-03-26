library(CAMAN)


### Name: mixalg.EM
### Title: EM algorithm
### Aliases: mixalg.EM
### Keywords: meta-analysis

### ** Examples

data(vitA)
m1<-mixalg.EM(obs="logrr",var.lnOR="var" ,family="gaussian",
              p=c(1),t=c(0),data=vitA)
m2<-mixalg.EM(obs="logrr",var.lnOR="var" ,family="gaussian",
              p=c(0.5,0.5),t=c(-0.3,0.2),data=vitA)

# apply EM-algorithm on an existing CAMAN.object: 
data(thai_cohort)
mix0 <- mixalg(obs="counts", weights="frequency", family="poisson", 
               data=thai_cohort, numiter=18000, acc=0.00001,startk=25)
em0<-mixalg.EM(mix0,p=c(1),t=c(1))
em1<-mixalg.EM(mix0,p=c(0.7,0.3),t=c(2,9))




