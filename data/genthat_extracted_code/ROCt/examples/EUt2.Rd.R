library(ROCt)


### Name: EUt2
### Title: Optimal Cut-Off Estimation Of A Prognostic Marker (The Two
###   Groups Are observed).
### Aliases: EUt2
### Keywords: utility

### ** Examples


# import and attach the data example

data(csl)
csl <- csl[order(csl$id, csl$time),]
csl$ordre <-0
for (i in unique(csl$id)) {csl$ordre[csl$id==i] <- 1:sum(csl$id==i)}

csl$ttt[csl$treat==0]<-"A"
csl$ttt[csl$treat==1]<-"B"

csl0 <- csl[csl$ordre==1,]
csl0<-csl0[,c(1,4,5,14,9)]

# the expected utility function for a prognostic up to 8 years

EUt.obj <- EUt2(csl0$eventT, csl0$dc, csl0$prot.base, treatment= csl0$ttt,
 pro.time=8, u.A0=0.75*0.95, u.A1=0, u.B0=0.75, u.B1=0)

plot(EUt.obj$table$cut.off, EUt.obj$table$utility, type="l",
 xlab="Cut-off values", ylab="Expected utility",col=1, lty=1)

segments(EUt.obj$estimation, 0, EUt.obj$estimation, EUt.obj$max.eu, lty=3)
segments(0, EUt.obj$max.eu, EUt.obj$estimation, EUt.obj$max.eu, lty=3)

text(EUt.obj$estimation-2, 3.38,
 paste("Optimal cut-off=",round(EUt.obj$estimation,2)), srt=90, cex=0.8)
 text(min(csl0$prot.base)+40, EUt.obj$max.eu-0.005,
 paste("Expected utility=",round(EUt.obj$max.eu,2)), cex=0.8) 

# the optimal cut-off: patients with an higher value should receive the treatment A

EUt.obj$estimation



