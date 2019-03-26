library(EnvNicheR)


### Name: Niche
### Title: Niche
### Aliases: Niche
### Keywords: Niche

### ** Examples


data(Carnivores)

Niche(data=Carnivores, variables= c("Altitude", "BIO1", "BIO3",
"BIO4", "BIO12"), Level="Genus", Taxon= c("Leopardus", "Puma", "Panthera"),
cex.boxplot=1.7)

#Remove the data set
rm(Carnivores)




