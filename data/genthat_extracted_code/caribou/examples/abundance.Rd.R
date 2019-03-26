library(caribou)


### Name: abundance
### Title: Post-calving method for caribou abundance estimation
### Aliases: abundance print.abundance

### ** Examples

data(GRH93)
abundance(GRH93, n=92) # default model="H"
abundance(GRH93, n=92, model="H")
abundance(GRH93, n=92, model="I")
abundance(GRH93, n=92, model="T", B=2)
abundance(GRH93, n=92, model="T", B=4)
abundance(GRH93, n=92, model="T", B=6)



