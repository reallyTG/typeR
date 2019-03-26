library(hsdar)


### Name: t.test
### Title: t-test for nri values
### Aliases: t.test.nri t.test,Nri-method

### ** Examples

data(spectral_data)


## Calculate nri-values for WorldView-2-8
spec_WV <- spectralResampling(spectral_data, "WorldView2-8",
                              response_function = FALSE)
nri_WV <- nri(spec_WV, recursive = TRUE)

## Perform t.tests between nri-values of both sites 
season <- SI(spec_WV)$season
ttestres <- t.test(x = nri_WV, y = season, alternative = "two.sided")
ttestres

## Plot p.values of t.tests
plot(ttestres)



