library(rcongresso)


### Name: fetch_partido
### Title: Fetches parties from API using a query.
### Aliases: fetch_partido

### ** Examples

PMB <- fetch_partido(id = 36887)
PT <- fetch_partido(sigla = "PT")
partidos2010a2014 <- fetch_partido(dataInicio = "2010-01-01", dataFim = "2014-12-31", itens = 100)



