library(colorSpec)


### Name: atmosphere
### Title: atmospheric transmittance along a horizontal path
### Aliases: atmosTransmittance
### Keywords: atmosphere

### ** Examples

trans = atmosTransmittance( c(5,10,15,20,25)*1000 ) # 5 distances with atmospheric defaults

# verify that transmittance[550]=0.02 at dist=25000
plot( trans, legend='bottomright', log='y' )

# repeat, but this time assign alpha and beta explicitly
trans = atmosTransmittance( c(5,10,15,20,25)*1000, aero=list(alpha=1,beta=0.0001) )



