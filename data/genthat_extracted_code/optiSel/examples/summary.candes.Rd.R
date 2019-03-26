library(optiSel)


### Name: summary.candes
### Title: Population Genetic Parameters at Different Times
### Aliases: summary.candes

### ** Examples

data(ExamplePed)
Pedig   <- prePed(ExamplePed, thisBreed="Hinterwaelder", lastNative=1970)
phen    <- Pedig[Pedig$Breed=="Hinterwaelder",]
pKin    <- pedIBD(Pedig)
pKinatN <- pedIBDatN(Pedig, thisBreed="Hinterwaelder")
pop     <- candes(phen=phen, pKin=pKin, pKinatN=pKinatN, quiet=TRUE, reduce.data=FALSE)
Param   <- summary(pop, tlim=c(1970,1995), histNe=150, base=1800, df=4)

plot(Param$t, Param$pKinatN,type="l", ylim=c(0,0.1))
lines(Param$t,Param$pKin, col="red")

plot(Param$t, Param$Ne,  type="l", ylim=c(0,100))
plot(Param$t, Param$NGE, type="l", ylim=c(0,10))
plot(Param$t, Param$I,   type="l", ylim=c(0,10))



