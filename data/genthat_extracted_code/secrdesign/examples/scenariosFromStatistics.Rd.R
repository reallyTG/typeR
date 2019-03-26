library(secrdesign)


### Name: scenariosFromStatistics
### Title: Make Scenarios to Match Capture Statistics
### Aliases: scenariosFromStatistics
### Keywords: datagen

### ** Examples


grid36 <- make.grid(nx = 6, ny = 6, spacing = 200)
mask <- make.mask(grid36, buffer = 2000)
scen <- scenariosFromStatistics (sigma = c(200,400), noccasions = 44,
    traps = grid36, mask = mask, nval = 14, rval = 34)
sim <- run.scenarios(scen, nrepl = 5, traps = grid36, mask = mask)
summary(sim)




