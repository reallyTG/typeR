library(theiaR)


### Name: TheiaQuery
### Title: A query to the Theia website
### Aliases: TheiaQuery

### ** Examples


## No test: 
# Create a query to Theia database, looking for tiles from Sentinel2
# satellite around Grenoble, between 2018-07-01 and 2018-07-06.

query <- list(collection = "SENTINEL2",
              town       = "Grenoble",
              start.date = "2018-07-01",
              end.date   = "2018-07-06")
q <- TheiaQuery$new(query)

# Show informations on found tiles
print(q$tiles)
## End(No test)




