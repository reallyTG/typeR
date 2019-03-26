library(PHYLOGR)


### Name: GarlandJanis.IC
### Title: Independet contrasts for Garland & Janis data set
### Aliases: GarlandJanis.IC
### Keywords: datasets

### ** Examples


# Multiple regression with independent contrasts
# excluding the polar bear - grizzly bear contrast
data(GarlandJanis.IC)
lm(running.speed ~ body.mass + hind.l.length - 1,
subset=names.contr!="Tm-Ur", data= GarlandJanis.IC)



## Not run: 
##D # This data set can be obtained from the original files as:
##D 
##D garland.janis.ic <- cbind(read.table("49ms.fic")[,c(3,4)],
##D                           read.table("49hmt.fic")[,c(3,4)])
##D 
##D branch.lengths <- read.table("49ms.fic")[,5]
##D garland.janis.ic <- garland.janis.ic/branch.lengths
##D names(garland.janis.ic) <- c("body.mass", "running.speed",
##D                              "hind.l.length", "mtf.ratio")
##D garland.janis.ic[garland.janis.ic$body.mass<0,] <-
##D         -1 * garland.janis.ic[ garland.janis.ic$body.mass<0, ]
##D garland.janis.ic$branch.lengths <- branch.lengths
##D garland.janis.ic$names.contr <-
##D                        as.factor(read.table("49ms.fic")[,1])
##D garland.janis.ic$clade.contr <-
##D     as.factor( c("root",rep("Carnivore",18), rep("Herbivore",29))) 
## End(Not run)





