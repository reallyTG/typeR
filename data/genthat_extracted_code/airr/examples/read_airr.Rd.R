library(airr)


### Name: read_airr
### Title: Read an AIRR TSV
### Aliases: read_airr read_rearrangement read_alignment

### ** Examples

# Get path to the rearrangement-example file
file <- system.file("extdata", "rearrangement-example.tsv.gz", package="airr")

# Load data file
df <- read_rearrangement(file)




