library(edpclient)


### Name: identifying
### Title: Identifying Columns
### Aliases: identifying identifying<- identifying_columns
###   identifying_columns<-

### ** Examples

  d <- data.frame(stringsAsFactors = FALSE, a = c(1, 4), id = c("A", "B"))
  identifying(d$id) <- TRUE
  identifying_columns(d) <- c("id")



