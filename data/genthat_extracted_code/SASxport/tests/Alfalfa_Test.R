## This test demonstrates that write.xport can exactly duplicate an
## existing SAS xport file "Alfalfa.xpt"

library(SASxport)
Sys.setenv("TZ"="GMT")

# existing data file
SPEC <- read.xport("Alfalfa.xpt", verbose=TRUE)

str(SPEC)

## Write it out again, pretending to be the same OS, SAS version, and creation date
write.xport(SPEC,
            file="Alfalfa2.xpt",
            cDate=strptime("23FEB18:03:32:49", format="%d%b%y:%H:%M:%S"),
            osType="X64_DS12",
            sasVer="9.4",
            autogen.formats=FALSE
            )

## Display for diff
if(!interactive())
  write.xport(SPEC,
              file="", # display inline
              cDate=strptime("23FEB18:03:32:49", format="%d%b%y:%H:%M:%S"),
              osType="X64_DS12",
              sasVer="9.4",
              autogen.formats=FALSE,
              verbose=TRUE
              )


## Load both files back in as raw data
a.1 <- readBin( con="Alfalfa.xpt",  what=raw(), n=3600 )
a.2 <- readBin( con="Alfalfa2.xpt", what=raw(), n=3600 )

## Test that the files are identical
stopifnot( all(a.1 == a.2) )
