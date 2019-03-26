library(scopr)


### Name: load_ethoscope
### Title: Load data from ethoscope result files
### Aliases: load_ethoscope

### ** Examples

dir <- paste0(scopr_example_dir(), "/ethoscope_results/")
data(region_id_metadata)
metadata <- link_ethoscope_metadata(region_id_metadata, dir)
print(metadata)

# Default data loading
dt <- load_ethoscope(metadata)
dt

# We use reference hour to set zt0 to 09:00 GMT
dt <- load_ethoscope(metadata, reference_hour=9)
dt

# Only load x and y positions
dt <- load_ethoscope(metadata, columns=c("x", "y"), reference_hour=9)
dt
# apply function whilst loading the data
dt <- load_ethoscope(metadata, reference_hour=9, FUN=head)
dt




