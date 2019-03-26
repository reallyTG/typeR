library(doBy)


### Name: data-codstom
### Title: Diet of Atlantic cod in the Gulf of St. Lawrence (Canada)
### Aliases: data-codstom codstom
### Keywords: datasets

### ** Examples


data(codstom)
str(codstom)
# removes multiple occurences of same prey.type in stomachs
codstom1 <- summaryBy(prey.mass ~ 
                      region + ship.type + ship.id + trip + set + fish.id + prey.type,
                      data = codstom, 
                      FUN = sum) 

# keeps a single line per stomach with the total mass of stomach content
codstom2 <- summaryBy(prey.mass ~ region + ship.type + ship.id + trip + set + fish.id,
                      data = codstom, 
                      FUN = sum) 

# mean prey mass per stomach for each trip
codstom3 <- summaryBy(prey.mass.sum ~ region + ship.type + ship.id + trip,
                      data = codstom2, FUN = mean) 

## Not run: 
##D           
##D # wide version, one line per stomach, one column per prey type
##D library(reshape)
##D codstom4 <- melt(codstom, id = c(1:7, 9))
##D codstom5 <- cast(codstom4, 
##D                  region + ship.type + ship.id + trip + set + fish.id + fish.length ~ 
##D                  prey.type, sum)
##D k <- length(names(codstom5))
##D prey_col <- 8:k
##D out <- codstom5[,prey_col]
##D out[is.na(out)] <- 0
##D codstom5[,prey_col] <- out
##D codstom5$total.content <- rowSums(codstom5[, prey_col])
## End(Not run)




