library(theiaR)


### Name: TheiaCollection
### Title: A collection of tiles from Theia
### Aliases: TheiaCollection

### ** Examples


## No test: 
# Create a collection from a query
## Create a query to Theia database, looking for tiles from Sentinel2
## satellite around Grenoble, between 2018-07-01 and 2018-07-06.

query <- list(collection = "SENTINEL2",
              town       = "Grenoble",
              start.date = "2018-07-01",
              end.date   = "2018-07-06")

## Create a collecion of tiles from this query
mycollection <- TheiaCollection$new(query = query, dir.path = ".")

print(mycollection)
## End(No test)

# Alternatively, you can create a collection from a cart file (that you can
# download from Theia's website)
cart.path <- system.file("extdata", "cart.meta4", package = "theiaR")

mycollection <- TheiaCollection$new(cart.path = cart.path,
                                    dir.path  = ".")

print(mycollection)

## Not run: 
##D # Download the tiles in the collection
##D mycollection$download()
## End(Not run)

## Not run: 
##D # Finally, you can extract zip archives containing the tiles
##D mycollection$extract(overwrite = FALSE)
## End(Not run)




