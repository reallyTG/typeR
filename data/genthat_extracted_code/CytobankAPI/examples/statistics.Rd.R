library(CytobankAPI)


### Name: statistics
### Title: Statistic Endpoints
### Aliases: statistics statistics.event_counts,UserSession-method
###   statistics.event_counts statistics.general,UserSession-method
###   statistics.general

### ** Examples

## No test: 
# Authenticate via username/password
cyto_session <- authenticate(site="premium", username="cyril_cytometry", password="cytobank_rocks!")
# Authenticate via auth_token
cyto_session <- authenticate(site="premium", auth_token="my_secret_auth_token")
## End(No test)
## No test: 
statistics.event_counts(cyto_session, 22, compensation_id=-2,
  fcs_files=c(12, 13, 14), channels=c(53, 54, 55), populations=c(32, 33, 34))
## End(No test)
## No test: 
# Full list with all fields present
statistics.general(cyto_session, 22, compensation_id=-2,
  fcs_files=c(12, 13, 14), channels=c(53, 54, 55), populations=c(32, 33, 34))

# Statistics list transformed into a dataframe, proliferating channel statistics by column
statistics.general(cyto_session, 22, compensation_id=-2,
  fcs_files=c(12, 13, 14), channels=c(53, 54, 55), populations=c(32, 33), output="dataframe_col")

# Statistics list transformed into a dataframe, proliferating channel statistics by row
statistics.general(cyto_session, 22, compensation_id=-2,
  fcs_files=c(12, 13, 14), channels=c(53, 54, 55), populations=c(32, 33), output="dataframe_row")

# Statistics list transformed into a dataframe, using helper functions (names_to_ids)
# Get FCS files that match 'pbmc' in their filename
fcs_files <- fcs_files.list(cyto_session, 22)
fcs_files <- fcs_files[,c("id", "filename")]
fcs_files <- unlist(fcs_files$id[grep("pbmc", fcs_files$filename)])

# Get channels that match 'pp' or 'pStat' as their longName
channels <- panels.list(cyto_session, 22)$`Panel 1`$channels
channels <- channels[,c("normalizedShortNameId", "shortName", "longName")]
channels <- channels$normalizedShortNameId[grep("pp.*|pStat.*", channels$longName)]

# Get populations that match 'CD' as their population name
populations <- populations.list(cyto_session, 22)
populations <- populations[,c("gateSetId", "name")]
populations <- populations$id[grep("CD.*", populations$name)]

statistics.general(cyto_session, 22, compensation_id=-2,
  fcs_files=fcs_files, channels=channels, populations=populations, output="dataframe_row")
## End(No test)



