library(NetworkInference)


### Name: policies
### Title: US State Policy Adoption (SPID)
### Aliases: policies policies_metadata
### Keywords: datasets

### ** Examples


data('policies')

# Join the adoption events with the metadata 
merged_policies <- merge(policies, policies_metadata, by = 'policy')



