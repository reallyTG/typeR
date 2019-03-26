library(intubate)


### Name: caper
### Title: Interfaces for caper package for data science pipelines.
### Aliases: ntbt_brunch ntbt_crunch ntbt_macrocaic ntbt_pgls
### Keywords: intubate magrittr caper brunch crunch macrocaic pgls

### ** Examples

## Not run: 
##D library(intubate)
##D library(magrittr)
##D library(caper)
##D 
##D ## ntbt_brunch: Calculate a linear model using the brunch algorithm
##D data(perissodactyla)
##D perisso <- comparative.data(perissodactyla.tree, perissodactyla.data, Binomial)
##D 
##D ## Original function to interface
##D brunch(log.female.wt ~ Territoriality, data = perisso)
##D 
##D ## The interface puts data as first parameter
##D ntbt_brunch(perisso, log.female.wt ~ Territoriality)
##D 
##D ## so it can be used easily in a pipeline.
##D perisso %>%
##D   ntbt_brunch(log.female.wt ~ Territoriality)
##D 
##D 
##D ## ntbt_crunch: Calculate a linear model using the crunch algorithm
##D data(shorebird)
##D shorebird <- comparative.data(shorebird.tree, shorebird.data, Species)
##D 
##D ## Original function to interface
##D crunch(Egg.Mass ~ F.Mass + M.Mass, data = shorebird)
##D 
##D ## The interface puts data as first parameter
##D ntbt_crunch(shorebird, Egg.Mass ~ F.Mass + M.Mass)
##D 
##D ## so it can be used easily in a pipeline.
##D shorebird %>%
##D   ntbt_crunch(Egg.Mass ~ F.Mass + M.Mass)
##D 
##D 
##D ## ntbt_macrocaic: Comparative analysis using independent
##D ##                 contrasts on species richness data
##D data(IsaacEtAl)
##D primates <- comparative.data(primates.tree, primates.data, binomial, na.omit=FALSE)
##D 
##D ## Original function to interface
##D macrocaic(species.rich ~ body.mass, data = primates)
##D 
##D ## The interface puts data as first parameter
##D ntbt_macrocaic(primates, species.rich ~ body.mass)
##D 
##D ## so it can be used easily in a pipeline.
##D primates %>%
##D   ntbt_macrocaic(species.rich ~ body.mass)
##D 
##D 
##D 
##D ## ntbt_pgls: Phylogenetic generalized linear models
##D data(shorebird)
##D shorebird <- comparative.data(shorebird.tree, shorebird.data, Species, vcv=TRUE, vcv.dim=3)
##D 
##D ## Original function to interface
##D pgls(log(Egg.Mass) ~ log(M.Mass) * log(F.Mass), shorebird, lambda='ML')
##D 
##D ## The interface puts data as first parameter
##D ntbt_pgls(shorebird, log(Egg.Mass) ~ log(M.Mass) * log(F.Mass), lambda='ML')
##D 
##D ## so it can be used easily in a pipeline.
##D shorebird %>%
##D   ntbt_pgls(log(Egg.Mass) ~ log(M.Mass) * log(F.Mass), lambda='ML')
## End(Not run)



