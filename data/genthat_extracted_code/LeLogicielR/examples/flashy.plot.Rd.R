library(LeLogicielR)


### Name: flashy.plot
### Title: Croisement de deux variables quantitatives
### Aliases: flashy.plot

### ** Examples

data(NUTRIAGE)
attach(NUTRIAGE)
sexe <- as.factor(sexe)
levels(sexe) <- c("Homme","Femme")
flashy.plot(poids,taille,sexe,xlab="Taille",ylab="Poids")
detach(NUTRIAGE)



