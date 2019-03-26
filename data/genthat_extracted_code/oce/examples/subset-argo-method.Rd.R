library(oce)


### Name: subset,argo-method
### Title: Subset an Argo Object
### Aliases: subset,argo-method

### ** Examples

library(oce)
data(argo)

# Example 1: buset by time, longitude, and pressure
par(mfrow=c(2,2))
plot(argo)
plot(subset(argo, time > mean(time)))
plot(subset(argo, longitude > mean(longitude)))
plot(subset(argoGrid(argo), pressure > 500 & pressure < 1000), which=5)

# Example 2: restrict attention to delayed-mode profiles.
par(mfrow=c(1, 1))
plot(subset(argo, dataMode == "D"))

# Example 3: contrast corrected and uncorrected data
par(mfrow=c(1,2))
plotTS(argo)
plotTS(subset(argo, "adjusted"))

# Example 4. Subset by a polygon determined with locator()
## Not run: 
##D par(mfrow=c(2, 1))
##D plot(argo, which="map")
##D bdy <- locator(4) # Click the mouse on 4 boundary points
##D argoSubset <- subset(argo, within=bdy)
##D plot(argoSubset, which="map")
## End(Not run)




