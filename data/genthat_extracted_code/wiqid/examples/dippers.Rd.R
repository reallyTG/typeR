library(wiqid)


### Name: dippers
### Title: Capture-recapture data for European dippers
### Aliases: dippers
### Keywords: datasets

### ** Examples

data(dippers)

DH <- dippers[1:7]  # Extract the detection histories
survCJS(DH)  # the phi(.) p(.) model
survCJS(DH, phi ~ .time)  # the phi(t) p(.) model

# Floods affected the 2nd and 3rd intervals
df <- data.frame(flood = c(FALSE, TRUE, TRUE, FALSE, FALSE, FALSE))
survCJS(DH, phi ~ flood, data=df)

# Including a grouping factor:
survCJS(DH, phi ~ flood * group, data=df, group=dippers$sex)

# Bayesian estimation:

## No test: 
Bdip <- BsurvCJS(DH, parallel=FALSE)
plot(Bdip)
BdipFlood <- BsurvCJS(DH, list(phi ~ flood, p ~ .time), data=df)
BdipFlood
op <- par(mfrow=2:1)
plot(BdipFlood, "phi1", xlim=c(0.3, 0.75), main="No flood")
plot(BdipFlood, "phi2", xlim=c(0.3, 0.75), main="Flood")
par(op)
ratio <- BdipFlood$phi2 / BdipFlood$phi1
plotPost(ratio, compVal=1)
## End(No test)



