library(sybil)


### Name: addExchReact
### Title: Add Exchange Reactions to a Model
### Aliases: addExchReact
### Keywords: manip

### ** Examples

  # add exchange reactions (allowing input) for the metabolites
  # malate and oxalacetate
  data(Ec_core)
  mod <- addExchReact(Ec_core,
                      met = c("mal_L[c]", "oaa[c]"),
                      lb = c(-20, -20))
  findExchReact(mod)



