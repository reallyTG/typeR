library(forestHES)


### Name: membership
### Title: Standardize the indices by membership functional models
### Aliases: membership

### ** Examples

up.index<-membership(mode="up",X=0.67,L=0,U=2.173)
up.index
down.index<-membership(mode="down",X=0.8,L=0,U=2.73)
down.index
mid.index<-membership(mode="mid",X=c(0.1,0.3,0.4,0.6,0.9),L=0.2,U=1.0,O1=0.5,O2=0.7)
mid.index



