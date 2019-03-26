library(calibrator)


### Name: etahat
### Title: Expectation of computer output
### Aliases: etahat
### Keywords: array

### ** Examples

data(toys)

etahat(D1=D1.toy, D2=D2.toy, H1=H1.toy, y=y.toy,
    E.theta=E.theta.toy, extractor=extractor.toy, phi=phi.toy)

# Now try giving E.theta=1:3, which will be interpreted as a value for theta:
etahat(D1=D1.toy, D2=D2.toy, H1=H1.toy, y=y.toy, E.theta=1:3,
     extractor=extractor.toy, phi=phi.toy)




