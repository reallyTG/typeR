library(fileplyr)


### Name: fileply
### Title: fileply
### Aliases: fileply

### ** Examples

# split-apply-combine
write.table(mtcars, "mtcars.csv", row.names = FALSE, sep = ",")
temp <- fileply(file     = "mtcars.csv"
             , groupby = c("carb", "gear")
             , fun     = identity
             , collect = "list"
             , sep     =  ","
             , header  = TRUE
             )
temp
unlink("mtcars.csv")

# chunkwise processing
write.table(mtcars, "mtcars.csv", row.names = FALSE, sep = ",")
temp <- fileply(file     = "mtcars.csv"
             , chunk   = 10
             , fun     = function(x){list(nrow(x))}
             , collect = "dataframe"
             , sep     =  ","
             , header  = TRUE
             )
temp
unlink("mtcars.csv")

# example for collect='none'
write.table(mtcars, "mtcars.csv", row.names = FALSE, sep = ",")
outdir <- utils::capture.output(temp <- fileply(file      = "mtcars.csv"
                                                , groupby = c("carb", "gear")
                                                , fun     = identity
                                                , sep     =  ","
                                                , header  = TRUE
                                                )
                                , file = NULL
                                , type = "message"
                                )
outdir <- gsub("Output Directory: ", "", outdir[5])
diskKV <- datadr::ddo(datadr::localDiskConn(outdir))
diskKV
diskKV[[1]]
unlink(outdir, recursive = TRUE)
unlink("mtcars.csv")




