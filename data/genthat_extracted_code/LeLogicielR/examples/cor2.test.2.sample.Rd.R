library(LeLogicielR)


### Name: cor2.test.2.sample
### Title: Comparaison de deux coefficients de correlation
### Aliases: cor2.test.2.sample

### ** Examples

data(IMC.ENFANT)
attach(IMC.ENFANT)
indf <- which(SEXE=="F")  # Permet de recuperer les indices des filles.
indg <- which(SEXE=="G")  # Permet de recuperer les indices des garcons.
cor2.test.2.sample(taille[indf],poids[indf],taille[indg],poids[indg])
detach(IMC.ENFANT)



