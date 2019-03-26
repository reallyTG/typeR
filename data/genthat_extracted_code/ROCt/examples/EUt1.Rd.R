library(ROCt)


### Name: EUt1
### Title: Optimal Cut-Off Estimation Of A Prognostic Marker (Only One
###   Group Is Observed).
### Aliases: EUt1
### Keywords: utility

### ** Examples


data(dataKTFS)

#  to respect the CRAN policy (run times < 5s)

dataKTFS <- dataKTFS[1:1500,]
dataKTFS$score <- round(dataKTFS$score, 1) 

# the expected utility function for a prognostic up to 8 years

EUt.obj <- EUt1(dataKTFS$time, dataKTFS$failure, dataKTFS$score, pro.time=8,
 u.A0=0.81*0.95, u.A1=0.53, u.B0=0.81, u.B1=0.53, rmst.change=0.2)

plot(EUt.obj$table$cut.off, EUt.obj$table$utility, type="l",
 xlab="Cut-off values", ylab="Expected utility", col=1, lty=1) 
 
segments(EUt.obj$estimation, 0, EUt.obj$estimation, EUt.obj$max.eu, lty=3)
segments(0, EUt.obj$max.eu, EUt.obj$estimation, EUt.obj$max.eu, lty=3)

text(EUt.obj$estimation-0.2, 6.22,
 paste("Optimal cut-off=", round(EUt.obj$estimation,2)), srt=90, cex=0.8)
 text(min(dataKTFS$score)+1.4, EUt.obj$max.eu-0.006,
 paste("Expected utility=", round(EUt.obj$max.eu, 2)), cex=0.8) 

# the optimal cut-off: patients with an higher value should receive the treatment A

EUt.obj$estimation



