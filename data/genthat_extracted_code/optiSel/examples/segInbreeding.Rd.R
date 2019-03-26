library(optiSel)


### Name: segInbreeding
### Title: Calculates Segment Based Inbreeding
### Aliases: segInbreeding

### ** Examples

data(map)
data(Cattle)
dir   <- system.file("extdata", package = "optiSel")
files <- file.path(dir, paste("Chr", 1:2, ".phased", sep=""))
f     <- segInbreeding(files, map, minSNP=20, minL=2.0)

Cattle2 <- merge(Cattle, f, by="Indiv")
tapply(Cattle2$Inbr, Cattle2$Breed, mean)
#    Angler  Fleckvieh   Holstein    Rotbunt 
#0.03842552 0.05169508 0.12431393 0.08386849 

boxplot(Inbr~Breed, data=Cattle2, ylim=c(0,1), main="Segment Based Inbreeding")

fIBD  <- segIBD(files, map, minSNP=20, minL=2.0)
identical(rownames(fIBD), f$Indiv)
#[1] TRUE

range(2*diag(fIBD)-1-f$Inbr)
#[1] -2.220446e-16  2.220446e-16



