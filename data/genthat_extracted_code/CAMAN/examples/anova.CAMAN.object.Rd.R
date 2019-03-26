library(CAMAN)


### Name: anova.CAMAN.object
### Title: ANOVA for finite mixture models
### Aliases: anova.CAMAN.object
### Keywords: meta-analysis

### ** Examples

data(thai_cohort)
mix0 <- mixalg(obs="counts", weights="frequency", family="poisson", data=thai_cohort,
               numiter=18000, acc=0.00001,startk=25)
em0<-mixalg.EM(mix0,p=c(1),t=c(1))
em1<-mixalg.EM(mix0,p=c(0.7,0.3),t=c(2,9))
## Not run: ll<-anova(em0,em1,nboot=250) #might take some minutes



