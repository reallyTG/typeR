library(fluxweb)


### Name: make.stability
### Title: making network stability
### Aliases: make.stability

### ** Examples


losses = 0.15 * groups.level$bodymasses^(-0.25)

# growth rates of basal sppecies
growth.rates = rep(NA, dim(groups.level$mat)[1])
growth.rates[colSums(groups.level$mat) == 0] = 0.5

val.mat = fluxing(groups.level$mat, 
                  groups.level$biomasses, 
                  losses, 
                  groups.level$efficiencies, 
                  bioms.pref = TRUE, 
                  ef.level = "pred")
make.stability(val.mat, 
               groups.level$biomasses, 
               losses, 
               groups.level$efficiencies, 
               growth.rates, 
               ef.level = "pred")




