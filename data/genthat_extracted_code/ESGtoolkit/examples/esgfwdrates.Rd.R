library(ESGtoolkit)


### Name: esgfwdrates
### Title: Instantaneous forward rates
### Aliases: esgfwdrates

### ** Examples

# Yield to maturities
txZC <- c(0.01422,0.01309,0.01380,0.01549,0.01747,0.01940,0.02104,0.02236,0.02348,
         0.02446,0.02535,0.02614,0.02679,0.02727,0.02760,0.02779,0.02787,0.02786,0.02776
         ,0.02762,0.02745,0.02727,0.02707,0.02686,0.02663,0.02640,0.02618,0.02597,0.02578,0.02563)

# Observed maturities
u <- 1:30

## Not run: 
##D par(mfrow=c(2,2))
##D fwdNS <- esgfwdrates(in.maturities = u, in.zerorates = txZC,
##D                     n = 10, horizon = 20,
##D                     out.frequency = "semi-annual", method = "NS")
##D matplot(time(fwdNS), fwdNS, type = 'l')
##D 
##D fwdSV <- esgfwdrates(in.maturities = u, in.zerorates = txZC,
##D                     n = 10, horizon = 20,
##D                     out.frequency = "semi-annual", method = "SV")
##D matplot(time(fwdSV), fwdSV, type = 'l')
##D 
##D fwdSW <- esgfwdrates(in.maturities = u, in.zerorates = txZC,
##D                     n = 10, horizon = 20,
##D                     out.frequency = "semi-annual", method = "SW")
##D matplot(time(fwdSW), fwdSW, type = 'l')
##D 
##D fwdHCSPL <- esgfwdrates(in.maturities = u, in.zerorates = txZC,
##D                        n = 10, horizon = 20,
##D                        out.frequency = "semi-annual", method = "HCSPL")
##D matplot(time(fwdHCSPL), fwdHCSPL, type = 'l')
## End(Not run)



