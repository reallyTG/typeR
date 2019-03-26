library(pomp)


### Name: Childhood disease incidence data
### Title: Historical childhood disease incidence data
### Aliases: LondonYorke ewmeas ewcitmeas
### Keywords: datasets

### ** Examples

plot(cases~time,data=LondonYorke,subset=disease=="measles",type='n',main="measles",bty='l')
lines(cases~time,data=LondonYorke,subset=disease=="measles"&town=="Baltimore",col="red")
lines(cases~time,data=LondonYorke,subset=disease=="measles"&town=="New York",col="blue")
legend("topright",legend=c("Baltimore","New York"),lty=1,col=c("red","blue"),bty='n')

plot(
     cases~time,
     data=LondonYorke,
     subset=disease=="chickenpox"&town=="New York",
     type='l',col="blue",main="chickenpox, New York",
     bty='l'
    )

plot(
     cases~time,
     data=LondonYorke,
     subset=disease=="mumps"&town=="New York",
     type='l',col="blue",main="mumps, New York",
     bty='l'
    )

plot(reports~time,data=ewmeas,type='l')

plot(reports~date,data=ewcitmeas,subset=city=="Liverpool",type='l')



