library(OECD)


### Name: get_dataset
### Title: Download OECD data sets.
### Aliases: get_dataset

### ** Examples

# Get entire dataset 
## Not run: df <- get_dataset("EPL_OV")
## Not run: head(df, 10)

# Apply filter on dimensions "country" and "series"
## Not run: 
##D df <- get_dataset("EPL_OV", 
##D                            filter = list(c("DEU", "FRA"), 
##D                            c("EPRC_V1", "EPRC_V2")), 
##D                            start_time = 2008, end_time = 2010)
## End(Not run)
## Not run: head(df, 10)

# Use pre-formatted filter copied from stats.oecd.org
## Not run: 
##D df <- get_dataset("PATS_REGION", 
##D                filter = "PCT_A.INVENTORS.BEL+BE10+BE21.TOTAL+BIOTECH+ICT",
##D                start_time = 2008, end_time = 2010, pre_formatted = TRUE)
## End(Not run)
## Not run: head(df, 10)




