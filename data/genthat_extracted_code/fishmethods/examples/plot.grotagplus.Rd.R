library(fishmethods)


### Name: plot.grotagplus
### Title: Plotting Tagging-Growth Objects
### Aliases: plot.grotagplus
### Keywords: misc

### ** Examples

# Plot of mean growth like that in Fig 8. of Francis & Francis (1992)
data(rig)
fit <- grotagplus(rig,dataID="Sex",alpha=70,beta=100,
                  model=list(mean="Francis",var="linear",seas="none"),
                 design=list(galpha=list("F","M"),gbeta=list("F","M"),
                             s=1,nu=1,m=0,p=0),
                  stvalue=list(galpha=c(5,4),gbeta=c(3,2),s=2,nu=0.5),
                  upper=list(galpha=c(8,6),gbeta=c(5,4),s=4,nu=1),
                 lower=list(galpha=c(3,2),gbeta=c(1.5,1),s=0.5,nu=0.2))
mnlenatage <- list(F=90.7*(1-exp(-0.42*(seq(1.5,6.5)-0.77))),
           M= 118.7*(1-exp(-0.16*(seq(4,11)-2.02))),
           PGM=161.1*(1-exp(-0.11*(seq(3.5,10.5)-1.91))))
plot(fit,age.based.growth=mnlenatage)
## Residual plots
fit <- grotagplus(rig,dataID="Sex",alpha=70,beta=100,
                  model=list(mean="Francis",var="linear",seas="none"),
                 design=list(galpha=list("F","M"),gbeta=list("F","M"),
                             s=1,nu=1,m=0,p=0),
                  stvalue=list(galpha=c(5,4),gbeta=c(3,2),s=2,nu=0.5),
                  upper=list(galpha=c(8,6),gbeta=c(5,4),s=4,nu=1),
                 lower=list(galpha=c(3,2),gbeta=c(1.5,1),s=0.5,nu=0.2))
plot(fit,"resid")
plot(fit,"resid",resid.spec=list(Pearson=FALSE,x="L1"))
## Trajectory plot as in Fig. 2 of Francis (1988)
data(bonito)
fit <- grotagplus(bonito,alpha=35,beta=55,
               design=list(galpha=1,gbeta=1,s=1,nu=1,m=1,p=1,u=1,w=1),
               stvalue=list(s=0.81,nu=0.3,m=0,p=0.01,u=0.5,w=0.5),
               upper=list(s=3,nu=1,m=2,p=0.1,u=1,w=1),
               lower=list(s=0.1,nu=0.1,m=-2,p=0,u=0,w=0))
plot(fit,"traj",Linitial=35)



