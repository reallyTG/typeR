library(LSDinterface)


### Name: read.raw.lsd
### Title: Read LSD results file and clean variables names
### Aliases: read.raw.lsd
### Keywords: interface file datasets database

### ** Examples

# Get the examples directory
path <- system.file( "extdata", package = "LSDinterface" )

# reads all instances of all variables,
# pasting the directory where the example files are (not required if in working dir)
bigTable <- read.raw.lsd( paste0( path, "/", "Sim1_1.res" ) )

# See matrix in the data viewer (require package 'utils')
## No test: 
View( bigTable )
## End(No test)

# reads all instances of all variables, skipping the initial 20 time steps
# and keeping up to 50 time steps (from t = 21 up to t = 70)
all21_70 <- read.raw.lsd( paste0( path, "/", "Sim1_2.res.gz" ),
                          skip = 20, nrows = 50 )
## No test: 
View( all21_70 )
## End(No test)



