library(fishmethods)


### Name: grotagplus
### Title: Flexible maximum likelihood estimation of growth from multiple
###   tagging datasets.
### Aliases: grotagplus
### Keywords: misc

### ** Examples

#Model 4 of Francis (1988)
data(bonito)
grotagplus(bonito,alpha=35,beta=55,
               design=list(galpha=1,gbeta=1,s=1,nu=1,m=1,p=1,u=1,w=1),
               stvalue=list(s=0.81,nu=0.3,m=0,p=0.01,u=0.5,w=0.5),
               upper=list(s=3,nu=1,m=2,p=0.1,u=1,w=1),
               lower=list(s=0.1,nu=0.1,m=-2,p=0,u=0,w=0))

#Model 1 of Francis (1988), using least-squares fit
grotagplus(bonito,alpha=35,beta=55,
               model=list(mean="Francis",var="least-squares",seas="none"),
               design=list(galpha=1,gbeta=1,s=1,p=0),
               stvalue=list(s=1.8),upper=list(s=3),lower=list(s=1))

#Paphies donacina model in Table 4 of Cranfield et al (1996) with
#asymptotic model
data(P.donacina)
grotagplus(P.donacina,alpha=50,beta=80,
       model=list(mean="asymptotic",var="linear",seas="none"),
       design=list(galpha=1,gbeta=1,Lstar=0,s=1,nu=0,m=0,p=0),
       stvalue=list(galpha=10,gbeta=1.5,s=2),
       upper=list(galpha=15,gbeta=2.7,s=4),
       lower=list(galpha=7,gbeta=0.2,s=0.5),
       fixvalue=list(Lstar=80))

#Paphies donacina model in Table 4 of Cranfield et al (1996) with
#asymptotic model
data(P.donacina)
grotagplus(P.donacina,alpha=50,beta=80,
       model=list(mean="asymptotic",var="linear",seas="none"),
       design=list(galpha=1,gbeta=1,Lstar=0,s=1,nu=0,m=0,p=0),
       stvalue=list(galpha=10,gbeta=1.5,s=2),
       upper=list(galpha=15,gbeta=2.7,s=4),
       lower=list(galpha=7,gbeta=0.2,s=0.5),
       fixvalue=list(Lstar=80))

# Model 4 fit from Francis and Francis (1992) with different growth by sex
data(rig)
grotagplus(rig,dataID="Sex",alpha=70,beta=100,
           model=list(mean="Francis",var="linear",seas="none"),
          design=list(galpha=list("F","M"),gbeta=list("F","M"),s=1,nu=1,m=0,p=0),
          stvalue=list(galpha=c(5,4),gbeta=c(3,2),s=2,nu=0.5),
          upper=list(galpha=c(8,6),gbeta=c(5,4),s=4,nu=1),
          lower=list(galpha=c(3,2),gbeta=c(1.5,1),s=0.5,nu=0.2))

#Example where all parameters are fixed 
# to the values estimated values for model 4 of Francis and Francis (1992)]
grotagplus(rig,dataID="Sex",alpha=70,beta=100,
          model=list(mean="Francis",var="linear",seas="none"),
          design=list(galpha=0,gbeta=0,s=0,nu=0,m=0,p=0),
          stvalue=list(),upper=list(),lower=list(),
          fixvalue=list(galpha=list(design=list("F","M"),value=c(5.87,3.67)),
          gbeta=list(design=list("F","M"),value=c(2.52,1.73)),s=1.57,nu=0.58))



