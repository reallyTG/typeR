library(alakazam)


### Name: extractVRegion
### Title: Extracts FWRs and CDRs from IMGT-gapped sequences
### Aliases: extractVRegion

### ** Examples

# Assign example clone
clone <- subset(ExampleDb, CLONE == 3138)

# Get all regions
extractVRegion(clone$SEQUENCE_IMGT)

# Get single region
extractVRegion(clone$SEQUENCE_IMGT, "FWR1")

# Get all CDRs
extractVRegion(clone$SEQUENCE_IMGT, c("CDR1", "CDR2"))

# Get all FWRs
extractVRegion(clone$SEQUENCE_IMGT, c("FWR1", "FWR2", "FWR3"))




