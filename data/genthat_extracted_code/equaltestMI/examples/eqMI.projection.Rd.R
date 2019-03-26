library(equaltestMI)


### Name: eqMI.projection
### Title: Projection-based method for testing latent means equality
### Aliases: eqMI.projection

### ** Examples

data(HolzingerSwineford)
semmodel<-'
L1 =~ V1 + V2 + V3
L2 =~ V4 + V5 + V6
L3 =~ V7 + V8
L4 =~ V9 + V10 + V11
'
run.pj <- eqMI.projection(model = semmodel, data = HolzingerSwineford,
          group = "school", meanstructure = TRUE)




