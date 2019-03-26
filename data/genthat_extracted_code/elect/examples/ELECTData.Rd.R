library(elect)


### Name: ELECTData
### Title: Three-state data for exploring 'elect'
### Aliases: ELECTData

### ** Examples

# Sample size:
print(length(unique(ELECTData$id)))
# Frequencies number of observation per individual:
print(table(table(ELECTData$id)))
# State table
print(statetable.msm(state, id, data = ELECTData))



