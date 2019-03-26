library(asciiSetupReader)


### Name: sas_ascii_reader
### Title: Read ASCII file using SAS Setup file.
### Aliases: sas_ascii_reader

### ** Examples

# Text file is zipped to save space.
dataset_name <- system.file("extdata", "example_data.zip",
  package = "asciiSetupReader")
sas_name <- system.file("extdata", "example_setup.sas",
  package = "asciiSetupReader")

## Not run: 
##D example <- sas_ascii_reader(dataset_name = dataset_name,
##D   sas_name = sas_name)
## End(Not run)

# Does not fix value labels
example2 <- sas_ascii_reader(dataset_name = dataset_name,
  sas_name = sas_name, value_label_fix = FALSE)

# Keeps original column names
example3 <- sas_ascii_reader(dataset_name = dataset_name,
  sas_name = sas_name, real_names = FALSE)

# Only returns the first 5 columns
example <- sas_ascii_reader(dataset_name = dataset_name,
  sas_name = sas_name, keep_columns = 1:5)



