library(SoilHyP)


### Name: SEM
### Title: Simplified evaporation method (SEM)
### Aliases: SEM

### ** Examples

# ----------------------------------------------------------------------------
# Calculate hydraulic properties with the 'Simplified Evaporation Method' (SEM)
# ----------------------------------------------------------------------------
data('dataSEM')
ths <- 0.7  # define saturated water content (ths) (optional)
shp <- SEM(suc.up     = dataSEM$tens.up,
          suc.low     = dataSEM$tens.low,
          weight      = dataSEM$weight,
          t           = dataSEM$hour*60*60,
          r           = 3.6, # radius of sample
          L           = 6,   # height of sample
          z1          = 1.5, # depth of upper tensiometer [cm]
          z2          = 4.5, # depth of lower tensiometer [cm]
          sd.tens     = 0.1,  # tensiometer accuracy (see ?SEM)
          ths         = ths,
          suc.negativ = TRUE,
          suc.out     = 'weighted'
)



