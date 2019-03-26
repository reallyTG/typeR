library(lmfor)


### Name: foto
### Title: CO2 exchange of transplanted Sphagnum fuscum moss in a
###   chronosequence of mires.
### Aliases: foto
### Keywords: datasets

### ** Examples

data(foto)

LightResp<-function(PPFD,alpha=0.1,Pmax=10,A0=0) {
	       A0+Pmax*PPFD/(alpha+PPFD)
           }
               
library(nlme)

model5<-nlme(A~LightResp(PARtop,alpha,Pmax,A0),
		fixed=list(alpha~Site+Treatment+moisture,Pmax~Site+Treatment,A0~Site),
		random=list(sample=Pmax+alpha~1),
		data=foto,
		start=c(c(80,0,0,0,0,0,0,0),c(100,0,0,0,0,0,0),c(-20,0,0,0,0,0)),
		verbose=TRUE)



