library(hsdar)


### Name: smgm
### Title: SMGM
### Aliases: smgm

### ** Examples

## Use PROSAIL to simulate spectra with different soil moisture content
Spektr.lib <- noiseFiltering(PROSAIL(parameterList = data.frame(psoil = seq(0,1,0.1),
                                                                LAI = 0)))

smgm_val <- smgm(Spektr.lib)

for (i in 1:nspectra(smgm_val))
  plot(smgm_val, FUN = i, new = i==1, col = i)

SI(smgm_val)



