library(replyr)


### Name: replyr_summary
### Title: Compute usable summary of columns of tbl.
### Aliases: replyr_summary

### ** Examples


d <- data.frame(p= c(TRUE, FALSE, NA),
                r= I(list(1,2,3)),
                s= NA,
                t= as.raw(3:5),
                w= 1:3,
                x= c(NA,2,3),
                y= factor(c(3,5,NA)),
                z= c('a',NA,'z'),
                stringsAsFactors=FALSE)
# sc <- sparklyr::spark_connect(version='2.2.0',
#                                  master = "local")
# dS <- replyr_copy_to(sc, dplyr::select(d, -r, -t), 'dS',
#                      temporary=TRUE, overwrite=TRUE)
# replyr_summary(dS)
# sparklyr::spark_disconnect(sc)
if (requireNamespace("RSQLite", quietly = TRUE)) {
  my_db <- DBI::dbConnect(RSQLite::SQLite(), ":memory:")
  RSQLite::initExtension(my_db)
  dM <- replyr_copy_to(my_db, dplyr::select(d, -r, -t), 'dM',
                       temporary=TRUE, overwrite=TRUE)
  print(replyr_summary(dM))
  DBI::dbDisconnect(my_db)
}
d$q <- list(1,2,3)
replyr_summary(d)




