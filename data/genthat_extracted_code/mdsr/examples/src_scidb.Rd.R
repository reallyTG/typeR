library(mdsr)


### Name: src_scidb
### Title: src_scidb
### Aliases: src_scidb dbConnect_scidb mysql_scidb

### ** Examples


dbAir <- src_scidb("airlines")
dbAir

dbAir <- dbConnect_scidb("airlines")
dbAir

if (require(knitr)) {
  opts_chunk$set(engine.opts = mysql_scidb("airlines"))
}



