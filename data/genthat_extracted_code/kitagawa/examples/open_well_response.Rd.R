library(kitagawa)


### Name: open_well_response
### Title: Spectral response for an open well
### Aliases: open_well_response open_well_response.default

### ** Examples

OWR <- open_well_response(1:10,1,1)
plot(OWR)
OWR <- open_well_response(1/(1:200),1,1,Ta=100,Hw=10,model="liu",freq.units="Hz")
plot(OWR)



