library(trajr)


### Name: TrajDirectionalChange
### Title: Directional change (DC)
### Aliases: TrajDirectionalChange

### ** Examples

set.seed(42)
trj <- TrajGenerate()
SD = mean(TrajDirectionalChange(trj))
SDDC = sd(TrajDirectionalChange(trj))




