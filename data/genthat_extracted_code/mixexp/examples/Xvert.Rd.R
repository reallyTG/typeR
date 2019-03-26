library(mixexp)


### Name: Xvert
### Title: This function creates an extreme vertices design in a
###   constrained mixture space.
### Aliases: Xvert
### Keywords: datagen

### ** Examples


# Polvoron Example from Lawson
des<-Xvert(3,uc=c(.8,.95,.50),lc=c(0,.10,.05),ndm=1,plot=FALSE)


#Snee Marquardt(1976) example
Xvert(8,uc=c(.45,.50,.10,.4,.6,.2,.05,.05),lc=c(.1,.05,0,0,.1,.05,0,0),ndm=0)
    
# Example page 465
exvert<-Xvert(4,uc=c(.188,.128,.438,.438),lc=c(.124,.064,.374,.374),ndm=2)

# Example from Piepel 1988
coef<-matrix(c(.85,.9,1,.7,0,1),ncol=3,byrow=TRUE)
des<-Xvert(3,lc=c(.1,.1,0),uc=c(.5,.7,.7),nlc=2,lb=c(.9,.4),ub=c(.95,0),coef,ndm=1,plot=FALSE)




