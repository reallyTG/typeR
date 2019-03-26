library(inbreedR)


### Name: r2_Wf
### Title: Expected r2 between inbreeding level (f) and fitness (W)
### Aliases: r2_Wf

### ** Examples

data(mouse_msats)
data(bodyweight)
genotypes <- convert_raw(mouse_msats)

(out <- r2_Wf(genotypes = genotypes, trait = bodyweight, family = "gaussian", type = "msats",
              nboot = 100, parallel = FALSE, ncores = NULL, CI = 0.95))





