## ----setup, include=FALSE------------------------------------------------
knitr::opts_chunk$set(collapse = TRUE, dev = "png", fig.width = 7, fig.height = 5, message = FALSE, warning = FALSE)

## ------------------------------------------------------------------------
library(minval)

## ------------------------------------------------------------------------
RECON <- read.csv(system.file("extdata", "rRECON2.csv", 
                              package = "minval"))
dim(RECON)

## ------------------------------------------------------------------------
RECONcharacteristics <- characterizeReactions(reactionList = RECON$REACTION)
RECONcharacteristics

## ---- echo = FALSE-------------------------------------------------------
compartmentNames <- c(c = "Cytosol", 
                      e = "Extracellular", 
                      g = "Golgi apparatus", 
                      l = "Lysosome", 
                      m = "Mitochondria", 
                      n = "Nucleus", 
                      r = "Endoplasmic reticulum",
                      x = "Peroxisome"
                      )

## ------------------------------------------------------------------------
pie(x = RECONcharacteristics$rType, 
    main = "Reactions by Type"
    )

## ------------------------------------------------------------------------
pie(x = RECONcharacteristics$cReaction, 
    main = "Reactions by Compartment", 
    labels = compartmentNames
    )

## ------------------------------------------------------------------------
pie(x = RECONcharacteristics$cMetabolites, 
    main = "Metabolites by Compartment", 
    labels = compartmentNames
    )

