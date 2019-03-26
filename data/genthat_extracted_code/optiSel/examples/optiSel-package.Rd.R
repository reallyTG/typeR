library(optiSel)


### Name: optiSel-package
### Title: Optimum Contribution Selection and Population Genetics
### Aliases: optiSel-package optiSel
### Keywords: package

### ** Examples


#See ?opticont for optimum contribution selection 
#These examples demonstrate computation of some population genetic parameters.

data(ExamplePed)
Pedig <- prePed(ExamplePed, thisBreed="Hinterwaelder", lastNative=1970)
head(Pedig)

############################################
# Evaluation of                            #
#    - kinships                            #
#    - genetic diversities                 #
#    - native effective size               #
#    - native genome equivalent            #
############################################

phen    <- Pedig[Pedig$Breed=="Hinterwaelder",]
pKin    <- pedIBD(Pedig)
pKinatN <- pedIBDatN(Pedig, thisBreed="Hinterwaelder")
pop     <- candes(phen=phen, pKin=pKin, pKinatN=pKinatN, quiet=TRUE, reduce.data=FALSE)
Param   <- summary(pop, tlim=c(1970,2005), histNe=150, base=1800, df=4)


plot(Param$t, Param$Ne, type="l", ylim=c(0,150), 
     main="Native Effective Size", ylab="Ne", xlab="")

matplot(Param$t, Param[,c("pKin", "pKinatN")], 
        type="l",ylim=c(0,1),main="Kinships", xlab="Year", ylab="mean Kinship")
abline(0,0)
legend("topleft", legend = c("pKin", "pKinatN"), lty=1:2, col=1:2, cex=0.6)

info <- paste("Base Year =", attributes(Param)$base, "  historic Ne =", attributes(Param)$histNe)

plot(Param$t,Param$NGE,type="l",main="Native Genome Equivalents", 
     ylab="NGE",xlab="",ylim=c(0,7))
mtext(info, cex=0.7)


############################################
# Genetic contributions from other breeds  #
############################################

cont <- pedBreedComp(Pedig, thisBreed='Hinterwaelder')
contByYear <- conttac(cont, Pedig$Born, use=Pedig$Breed=="Hinterwaelder", mincont=0.04, long=FALSE)
round(contByYear,2)

barplot(contByYear, ylim=c(0,1), col=1:10, ylab="genetic contribution",
        legend=TRUE, args.legend=list(x="topleft",cex=0.6))


######################################################
# Frequencies of haplotype segments in other breeds  #
######################################################

data(map)
data(Cattle)
dir   <- system.file("extdata", package="optiSel")
files <- file.path(dir, paste("Chr", 1:2, ".phased", sep=""))

Freq <- freqlist(
  haplofreq(files, Cattle, map, thisBreed="Angler", refBreeds="Rotbunt",   minSNP=20),
  haplofreq(files, Cattle, map, thisBreed="Angler", refBreeds="Holstein",  minSNP=20),
  haplofreq(files, Cattle, map, thisBreed="Angler", refBreeds="Fleckvieh", minSNP=20)
  )

plot(Freq, ID=1, hap=2, refBreed="Rotbunt")





