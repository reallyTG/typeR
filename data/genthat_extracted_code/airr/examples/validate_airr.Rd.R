library(airr)


### Name: validate_airr
### Title: Validate AIRR data
### Aliases: validate_airr

### ** Examples

# Get path to the rearrangement-example file
file <- system.file("extdata", "rearrangement-example.tsv.gz", package="airr")

# Load data file
df <- read_rearrangement(file)

# Validate a data.frame against the Rearrangement schema
validate_airr(df, schema=RearrangementSchema)




