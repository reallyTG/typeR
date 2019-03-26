library(pool)


### Name: dbPool
### Title: Create a DBI Database Connection Pool.
### Aliases: dbPool

### ** Examples

if (requireNamespace("RMySQL", quietly = TRUE)) {
  pool <- dbPool(
    drv = RMySQL::MySQL(),
    dbname = "shinydemo",
    host = "shiny-demo.csa7qlmguqrf.us-east-1.rds.amazonaws.com",
    username = "guest",
    password = "guest"
  )

  dbGetQuery(pool, "SELECT * from City LIMIT 5;")
  #>   ID           Name CountryCode      District Population
  #> 1  1          Kabul         AFG         Kabol    1780000
  #> 2  2       Qandahar         AFG      Qandahar     237500
  #> 3  3          Herat         AFG         Herat     186800
  #> 4  4 Mazar-e-Sharif         AFG         Balkh     127800
  #> 5  5      Amsterdam         NLD Noord-Holland     731200

  poolClose(pool)

} else {
  message("Please install the 'RMySQL' package to run this example")
}



