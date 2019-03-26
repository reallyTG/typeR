## ---- echo = FALSE, message = FALSE-----------------------------------------------------------------------------------
knitr::opts_chunk$set(comment = "")
options(width = 120, max.print = 100)

## ---- eval=FALSE------------------------------------------------------------------------------------------------------
#  install.packages("scidb")

## ---- eval=FALSE------------------------------------------------------------------------------------------------------
#  devtools::install_github("Paradigm4/SciDBR")

## ---- eval=FALSE------------------------------------------------------------------------------------------------------
#  library("scidb")
#  db <- scidbconnect()

## ---- eval=FALSE------------------------------------------------------------------------------------------------------
#  db <- scidbconnect(port=8083, username="root", password="Paradigm4")

## ---- eval=FALSE------------------------------------------------------------------------------------------------------
#  db <- scidbconnect(port=8083, username="root", password=getpwd())

## ---- eval=FALSE------------------------------------------------------------------------------------------------------
#  options(scidb.prefix="set_role('functionary')")

## ---- eval=FALSE------------------------------------------------------------------------------------------------------
#  library(scidb)
#  db <- scidbconnect()
#  db <- scidb_prefix(db, "set_role('functionary')")
#  print(db)

## ---- eval=FALSE------------------------------------------------------------------------------------------------------
#  db <- scidbconnect()
#  print(db)    # summarize connection
#  ls(db)       # quick list of arrays
#  ls.str(db)   # quick list of AFL operators
#  # db$<TAB>   # interactive completion list of AFL operators

## ---- eval=FALSE------------------------------------------------------------------------------------------------------
#  x <- scidb(db, "build(<v:double>[i=1:2,2,0, j=1:3,1,0], i*j)")
#  print(x)

## ---- eval=FALSE------------------------------------------------------------------------------------------------------
#  y <- store(db, x, temp=TRUE)
#  print(y)

## ---- eval=FALSE------------------------------------------------------------------------------------------------------
#  ls(db)   # (observe y's corresponding array in the list)
#  rm(y)
#  gc()
#  ls(db)   # (y's corresponding array will no longer appear)

## ---- eval=FALSE------------------------------------------------------------------------------------------------------
#  schema(x)
#  # [1] "<v:double> [i=1:2:0:2; j=1:3:0:1]"
#  
#  schema(x, "attributes")
#  #   name   type nullable
#  # 1    v double     TRUE
#  
#  schema(x, "dimensions")
#  #   name start end chunk overlap
#  # 1    i     1   2     2       j
#  # 2    0     1   3     1       0

## ---- eval=FALSE, echo=TRUE-------------------------------------------------------------------------------------------
#  x <- as.scidb(db, head(iris))
#  as.R(x)

## ---- eval=FALSE, echo=TRUE-------------------------------------------------------------------------------------------
#  iquery(db, "build(<v:double>[i=1:2,2,0, j=1:3,1,0], i*j)", return=TRUE)

## ---- eval=FALSE, echo=TRUE-------------------------------------------------------------------------------------------
#  db <- scidbconnect()
#  x <- db$build("<v:double>[i=1:2,2,0, j=1:3,1,0]", i * j)
#  y <- db$apply(x, a, 2 * v, b, "'a character string'")
#  print(y)

## ---- eval=FALSE, echo=TRUE-------------------------------------------------------------------------------------------
#  x <- db$build("<v:double>[i=1:2,2,0, j=1:3,1,0]", i * j)

## ---- eval=FALSE, echo=TRUE-------------------------------------------------------------------------------------------
#  jlim <- 3
#  z <- pi
#  x <- db$build("<v:double>[i=1:2,2,0, j=1:R(jlim),1,0]", i * j + R(z))

## ---- eval=FALSE------------------------------------------------------------------------------------------------------
#  help(db$aggregate)

## ---- eval=FALSE------------------------------------------------------------------------------------------------------
#  aflhelp(db, "aggregate")

## ---- eval=FALSE, echo=TRUE-------------------------------------------------------------------------------------------
#  db <- scidbconnect()
#  x <- as.scidb(db, iris)     # upload the iris data frame to SciDB
#  as.R(db$grouped_aggregate(x, Species, avg(Petal_Length) %as% avg))

## ---- eval=FALSE, echo=TRUE-------------------------------------------------------------------------------------------
#  db <- scidbconnect()
#  x <- as.scidb(db, iris)     # upload the iris data frame to SciDB
#  iquery(db, paste("grouped_aggregate(", x@name, ", Species, avg(Petal_Length) as avg)"), return=TRUE)

