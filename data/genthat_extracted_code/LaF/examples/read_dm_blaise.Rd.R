library(LaF)


### Name: read_dm_blaise
### Title: Read in Blaise data models
### Aliases: read_dm_blaise

### ** Examples

# Generate test data
lines <- c(
    " 1M 1.45Rotterdam ",
    " 2F12.00Amsterdam ",
    " 3  .22 Berlin    ",
    "  M22   Paris     ",
    " 4F12345London    ",
    " 5M     Copenhagen",
    " 6M-12.1          ",
    " 7F   -1Oslo      ")
writeLines(lines, con="tmp.dat")

# Create a file containing the data model
writeLines(c( 
    "DATAMODEL test", 
    "FIELDS", 
    "  id     : INTEGER[2]", 
    "  gender : STRING[1]", 
    "  x      : REAL[5] {comment}", 
    "  city   : STRING[10]", 
    "ENDMODEL"), con="tmp.bla")
model <- read_dm_blaise("tmp.bla", datafilename="tmp.dat")
laf <- laf_open(model)




