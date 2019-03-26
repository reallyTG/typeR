library(EcoIndR)


### Name: DER
### Title: DIFFERENTIATING SAMPLES USING RARITY, HETEROGENEITY, EVENNESS,
###   TAXONOMIC, PHYLOGENETIC AND FUNCTIONAL DIVERSITY INDICES
### Aliases: DER
### Keywords: DER

### ** Examples


#An example without functional diversity

data(Rotifers)

DER(data=Rotifers, Samples=c("J1.1","K4.1","G3.1","F2.1","K2.2","F8.2","F8.1",
"F1.1","F4.1","J2.1","E5.1","H5.1","K3.2","E4.2","I6.1","K2.1","J5.1","I3.1",
"K3.3","G5.1","E6.1","J1.2","J6.1","G7.1","G6.1","G4.1","E3.1","E4.3","E2.1",
"H6.2","F7.1","J6.2"), Species="Species", Taxon=c("Class","Subclass",
"Superorder","Order","Family","Genus"), pos="Pos", Index=c("Rarity","Menhinick",
"McIntoshE", "Dstar") )






