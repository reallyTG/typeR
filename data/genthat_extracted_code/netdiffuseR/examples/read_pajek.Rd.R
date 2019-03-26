library(netdiffuseR)


### Name: read_pajek
### Title: Read foreign graph formats
### Aliases: read_pajek read_net read_dl read_ml

### ** Examples

# From .net: Sampson monastery data from UCINET dataset ---------------------

# Reading the arcs/edges format
path <- system.file("extdata", "SAMPSON.NET", package = "netdiffuseR")
SAMPSON <- read_pajek(path)

# Reading the arcslist/edgelist format
path <- system.file("extdata", "SAMPSONL.NET", package = "netdiffuseR")
SAMPSONL <- read_pajek(path)

# From DL (UCINET): Sampson monastery data (again) --------------------------
path <- system.file("extdata", "SAMPSON.DAT", package = "netdiffuseR")
SAMPSONL <- read_ml(path)




