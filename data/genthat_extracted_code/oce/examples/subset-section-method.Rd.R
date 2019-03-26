library(oce)


### Name: subset,section-method
### Title: Subset a Section Object
### Aliases: subset,section-method

### ** Examples

library(oce)
data(section)

# Example 1. Stations within 500 km of the first station
starting <- subset(section, distance < 500)

# Example 2. Stations east of 50W
east <- subset(section, longitude > (-50))

# Example 3. Gulf Stream
GS <- subset(section, 109 <= stationId & stationId <= 129)

# Example 4. Only stations with more than 5 pressure levels
long <- subset(section, length(pressure) > 5)

# Example 5. Only stations that have some data in top 50 dbar
surfacing <- subset(section, min(pressure) < 50)

# Example 6. Similar to #4, but done in more detailed way
long <- subset(section,
   indices=unlist(lapply(section[["station"]],
                  function(s)
                    5 < length(s[["pressure"]]))))

# Example 7. Subset by a polygon determined with locator()
## Not run: 
##D par(mfrow=c(2, 1))
##D plot(section, which="map")
##D bdy <- locator(4) # choose a polygon near N. America
##D GS <- subset(section, within=bdy)
##D plot(GS, which="map")
## End(Not run)




