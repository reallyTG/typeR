library(airr)


### Name: write_airr
### Title: Write an AIRR TSV
### Aliases: write_airr write_rearrangement write_alignment

### ** Examples

# Get path to the rearrangement-example file
file <- system.file("extdata", "rearrangement-example.tsv.gz", package="airr")

# Load data file
df <- read_rearrangement(file)

# Write a Rearrangement data file
outfile <- file.path(tempdir(), "output.tsv")
write_rearrangement(df, outfile)




