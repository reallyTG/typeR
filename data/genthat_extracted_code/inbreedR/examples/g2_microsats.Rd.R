library(inbreedR)


### Name: g2_microsats
### Title: Estimating g2 from microsatellite data
### Aliases: g2_microsats

### ** Examples

data(mouse_msats)
# tranform raw genotypes into 0/1 format
genotypes <- convert_raw(mouse_msats)
(g2_mouse <- g2_microsats(genotypes, nperm = 1000, nboot = 100, CI = 0.95))




