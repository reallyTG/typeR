library(scbursts)


### Name: bursts.space_out
### Title: Artificially add amount of time between bursts (in absence of
###   recording information).
### Aliases: bursts.space_out

### ** Examples

infile <- system.file("extdata", "example2_qub.dwt", package = "scbursts")
dwells <- dwt.read(infile)

# Still a list, but the meta-data is fixed
spaced_records <- bursts.space_out(dwells, sep_factor=1000)

# Combine them, and they'll be nicely spaced out.
single_record <- bursts.recombine(spaced_records)

# You can now plot that single_record using one of the plot functions.




