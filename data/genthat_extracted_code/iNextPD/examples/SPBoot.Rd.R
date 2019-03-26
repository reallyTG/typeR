library(iNextPD)


### Name: SPBoot
### Title: Estimation of species relative abundance or detection
###   probability distribution
### Aliases: SPBoot

### ** Examples

data(bird)
bird.inc <- bird$inci
SPBoot(bird$abun, datatype="abundance")
SPBoot(bird$inci, datatype="incidence_raw")



