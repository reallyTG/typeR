library(airr)


### Name: ExampleData
### Title: Example AIRR data
### Aliases: ExampleData

### ** Examples

# Get path to the rearrangement-example file
file <- system.file("extdata", "rearrangement-example.tsv.gz", package="airr")

# Load data file
df <- read_rearrangement(file)




