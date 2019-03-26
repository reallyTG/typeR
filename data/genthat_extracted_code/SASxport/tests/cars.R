library(SASxport)
Sys.setenv("TZ"="GMT")


cars <- read.table(file="cars.sas", skip=4, nrows=26,
                   col.names=c("MAKE","PRICE","MPG","REP78","FOREIGN"),
                   header=F)

head(cars, n=5)

summary(cars)

## Write to file
write.xport(cars,
            file="cars2.xpt",
            cDate=strptime("23FEB18:04:03:38", format="%d%b%y:%H:%M:%S"),
            osType="X64_DS12",
            sasVer="9.4",
            autogen.formats=FALSE
            )

## Display for diff
if(!interactive())
  write.xport(cars,
              file="",
              cDate=strptime("23FEB18:04:03:38", format="%d%b%y:%H:%M:%S"),
              osType="X64_DS12",
              sasVer="9.4",
              autogen.formats=FALSE,
              verbose=TRUE
              )

## Load both files back in as raw data
a.1 <- readBin( con="cars.xpt",  what=raw(), n=1e5)
a.2 <- readBin( con="cars2.xpt", what=raw(), n=1e5)

## Test that the files are identical
stopifnot( all(a.1 == a.2) )
