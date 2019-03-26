library(asciiSetupReader)


### Name: spss_ascii_reader
### Title: Read ASCII file using SPSS Setup file.
### Aliases: spss_ascii_reader

### ** Examples

# Text file is zipped to save space.
dataset_name <- system.file("extdata", "example_data.zip",
  package = "asciiSetupReader")
sps_name <- system.file("extdata", "example_setup.sps",
  package = "asciiSetupReader")

## Not run: 
##D example <- spss_ascii_reader(dataset_name = dataset_name,
##D   sps_name = sps_name)
## End(Not run)

# Does not fix value labels
example2 <- spss_ascii_reader(dataset_name = dataset_name,
  sps_name = sps_name, value_label_fix = FALSE)

# Keeps original column names
example3 <- spss_ascii_reader(dataset_name = dataset_name,
  sps_name = sps_name, real_names = FALSE)

# Only returns the first 5 columns
example4 <- spss_ascii_reader(dataset_name = dataset_name,
  sps_name = sps_name, keep_columns = 1:5)



