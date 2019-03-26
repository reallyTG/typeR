library(SoilR)


### Name: IntCal13
### Title: Atmospheric radiocarbon for the 0-50,000 yr BP period
### Aliases: IntCal13
### Keywords: datasets

### ** Examples



     plot(IntCal13$CAL.BP,IntCal13$C14.age-IntCal13$Error,type="l",col=2,
          xlab="cal BP",ylab="14C BP")
     lines(IntCal13$CAL.BP,IntCal13$C14.age+IntCal13$Error,col=2)

     plot(IntCal13$CAL.BP,IntCal13$Delta.14C+IntCal13$Sigma,type="l",col=2,
          xlab="cal BP",ylab="Delta14C")
     lines(IntCal13$CAL.BP,IntCal13$Delta.14C-IntCal13$Sigma,col=2)




