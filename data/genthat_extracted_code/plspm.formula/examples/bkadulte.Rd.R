library(plspm.formula)


### Name: bkadulte
### Title: Adult Resilience Dataset From Bouake (Ivory Coast)
### Aliases: bkadulte
### Keywords: datasets

### ** Examples

## Load data
data(bkadulte)
str(bkadulte) 
bkmodele <- "
             ## modele de mesure 
              SDH =~ senshum+creativite 
              APS =~ communic+sociabilite+altruiste+relation
              HRP =~ planific+solution+autonome
              SCI =~ estime+confiance+favenir
              SPI =~ optimisme+persever+religion 
            ## interactions 
              HRP ~~ SDH+SCI
              SCI ~~ SDH
              APS ~~ SDH
              SPI ~~ APS+SCI
          "
## PLSPM estimation based on formula
bkmodes <- rep("A",5)  
bkres.plspm <- plspm.formula(Formula = bkmodele, Data = bkadulte, modes = bkmodes, 
                        plot.outer = TRUE, plot.inner = TRUE, scaled = FALSE)
## Computation plspm parameters only based on formula
bkres.param <- plspm.params(Formula = bkmodele, Data = bkadulte)
bkres.param$inner.mat
bkres.param$outer.list



