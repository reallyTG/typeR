library(fileplyr)


### Name: ddfply
### Title: ddfply
### Aliases: ddfply

### ** Examples

write.table(mtcars, "mtcars.csv", row.names = FALSE, sep = ",")
# create a ddf by keeping `keepddf = TRUE`
co <- capture.output(temp <- fileply("mtcars.csv"
                                     , groupby = c("carb", "gear")
                                     , fun     = identity
                                     , collect = "list"
                                     , sep     =  ","
                                     , header  = TRUE
                                     , keepddf = TRUE)
                     , file = NULL
                     , type = "message"
                     )
# use the ddf instead of reading the CSV again
temp2 <- ddfply(file.path(strsplit(co[6], ": ")[[1]][2], "data")
                , groupby = c("gear")
                , fun     = identity
                , collect = "list"
                , sep     =  ","
                , header  = TRUE
                )
temp2
unlink("mtcars.csv")
unlink(strsplit(co[6], ": ")[[1]][2], recursive = TRUE)




