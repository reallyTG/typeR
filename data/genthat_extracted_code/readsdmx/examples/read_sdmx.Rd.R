library(readsdmx)


### Name: read_sdmx
### Title: Read SDMX data
### Aliases: read_sdmx

### ** Examples

f <- system.file("extdata/compact_2.0.xml", package = "readsdmx")
d <- readsdmx::read_sdmx(f)

## Not run: 
##D u <-
##D  "https://stats.oecd.org/restsdmx/sdmx.ashx/GetData/HH_DASH/..Q/all?format=compact_v2"
##D d <- readsdmx::read_sdmx(u)
## End(Not run)




