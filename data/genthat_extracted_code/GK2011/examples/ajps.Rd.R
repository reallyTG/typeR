library(GK2011)


### Name: ajps
### Title: Gaines and Kuklinski (2011) AJPS data
### Aliases: ajps
### Keywords: datasets

### ** Examples

data(ajps)

# replicate Gaines and Kuklinski (2011) Table 2
pmean <- function(x) sprintf("%0.1f", mean(x))
cbind(
  # Democrats
  aggregate(cbind(therm.mccain, therm.obama) ~ tr, 
            data = ajps[ajps$pid == 1, ], FUN = pmean)[, 1:3],
  n_dem = aggregate(therm.obama ~ tr, 
                    data = ajps[ajps$pid == 1, ], FUN = length)[, 2],
  # Republicans
  aggregate(cbind(therm.mccain, therm.obama) ~ tr, 
            data = ajps[ajps$pid == -1, ], FUN = pmean)[, 2:3],
  n_rep = aggregate(therm.obama ~ tr, 
                    data = ajps[ajps$pid == -1, ], FUN = length)[, 2]
)

# effects for McCain among Democrats
with(ajps[ajps$pid == 1, ], {
  estimate(rand = tr %in% 1:2, tr = tr %in% c(1,3), y = therm.mccain)
})
# effects for McCain among Republicans
with(ajps[ajps$pid == -1, ], {
  estimate(rand = tr %in% 1:2, tr = tr %in% c(1,3), y = therm.mccain)
})

# effects for Obama among Democrats
with(ajps[ajps$pid == 1, ], {
  estimate(rand = tr %in% 1:2, tr = tr %in% c(1,3), y = therm.obama)
})
# effects for Obama among Republicans
with(ajps[ajps$pid == -1, ], {
  estimate(rand = tr %in% 1:2, tr = tr %in% c(1,3), y = therm.obama)
})



