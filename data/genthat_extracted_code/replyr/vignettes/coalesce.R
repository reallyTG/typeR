## ----setup---------------------------------------------------------------
library("dplyr")
library("replyr")

## ----simpleexample-------------------------------------------------------
# single column key example
data <- data.frame(year = c(2005,2007,2010),
                   count = c(6,1,NA),
                   name = c('a','b','c'),
                   stringsAsFactors = FALSE)
support <- data.frame(year=2005:2010)
filled <- replyr_coalesce(data, support,
                          fills=list(count=0))
filled <- filled[order(filled$year), ]
filled

## ----crossproductexample-------------------------------------------------
# complex key example
data <- data.frame(year = c(2005,2007,2010),
                   count = c(6,1,NA),
                   name = c('a','b','c'),
                   stringsAsFactors = FALSE)
support <- expand.grid(year=2005:2010,
                   name= c('a','b','c','d'),
                   stringsAsFactors = FALSE)
filled <- replyr_coalesce(data, support,
                          fills=list(count=0))
filled <- filled[order(filled$year, filled$name), ]
filled

## ----irregularexample----------------------------------------------------
# cities and counties
def <- data.frame(county= c('Calaveras County',
                            'Colusa County',
                            'Colusa County'),
                  city= c('Angels Camp',
                          'Colusa',
                          'Williams'),
                  stringsAsFactors= FALSE)
counts <- data.frame(county= c('Calaveras County',
                               'Colusa County'),
                     city= c('Angels Camp',
                             'Colusa'),
                     n= c(2,3),
                     stringsAsFactors= FALSE)
replyr::replyr_coalesce(counts, def, fills = list(n=0))

## ----checkpkg------------------------------------------------------------
execute_vignette <- requireNamespace("RSQLite", quietly = TRUE)

## ----dbexample, eval=execute_vignette------------------------------------

my_db <- DBI::dbConnect(RSQLite::SQLite(), ":memory:")
RSQLite::initExtension(my_db)
dbData <- dplyr::copy_to(my_db, data)
dbSupport <- dplyr::copy_to(my_db, support)
replyr::replyr_coalesce(dbData, dbSupport, 
                        fills = list(count=0))

## ----fill, eval=execute_vignette-----------------------------------------
d <- data.frame(x=c('a','c'), n=c(1,NA), 
                stringsAsFactors=FALSE)
s <- data.frame(x=c('a','b','c'), 
                stringsAsFactors=FALSE)

print(d)

replyr::replyr_coalesce(d,s,
                        fills= list(n=0))

## ----detect, eval=execute_vignette---------------------------------------
d <- data.frame(x=c('a','c'), n=c(1,NA), 
                stringsAsFactors=FALSE)
s <- data.frame(x=c('a','b'), 
                stringsAsFactors=FALSE)
tryCatch(
  replyr::replyr_coalesce(d,s,
                        fills= list(n=0)),
  error= function(e) { e })

## ----cleanup-------------------------------------------------------------
DBI::dbDisconnect(my_db)
rm(list=ls())
gc()

