library(rppo)


### Name: ppo_data
### Title: Access Data From the Global Plant Phenology Data Portal
### Aliases: ppo_data
### Keywords: data download phenology plant

### ** Examples


r1 <- ppo_data(genus = "Quercus", termID='obo:PPO_0002313', limit=10)

r2 <- ppo_data(fromDay = 1, toDay = 100, bbox="37,-120,38,-119", limit=10)

my_data_frame <- r2$data



