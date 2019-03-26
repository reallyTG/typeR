library(stream)


### Name: DSD_ReadDB
### Title: Read a Data Stream from an open DB Query
### Aliases: DSD_ReadDB

### ** Examples

### create a data base with a table with 3 Gaussians
library("RSQLite")
con <- dbConnect(RSQLite::SQLite(), ":memory:")

points <- get_points(DSD_Gaussians(k=3, d=2), 600, class = TRUE)
head(points)

dbWriteTable(con, "gaussians", points)
  
### prepare a query result set  
res <- dbSendQuery(con, "SELECT X1, X2, class FROM gaussians")
res
  
### create a stream interface to the result set  
stream <- DSD_ReadDB(res, k=3, class = 3)

### get points
get_points(stream, 5, class = TRUE)  
plot(stream)
  
### clean up  
dbClearResult(res)
dbDisconnect(con)



