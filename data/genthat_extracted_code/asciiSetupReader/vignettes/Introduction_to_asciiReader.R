## ------------------------------------------------------------------------
dataset_name <- system.file("extdata", "example_data.zip",
             package = "asciiSetupReader")
sps_name <- system.file("extdata", "example_setup.sps",
             package = "asciiSetupReader")

example <- asciiSetupReader::spss_ascii_reader(dataset_name = dataset_name,
sps_name = sps_name)
example[1:6, 1:4] # Look at first 6 rows and first 4 columns

## ------------------------------------------------------------------------
example <- asciiSetupReader::spss_ascii_reader(dataset_name = dataset_name,
sps_name = sps_name,
value_label_fix = FALSE)
example[1:6, 1:4] # Look at first 6 rows and first 4 columns

## ------------------------------------------------------------------------
example <- asciiSetupReader::spss_ascii_reader(dataset_name = dataset_name,
sps_name = sps_name,
real_names = FALSE)
example[1:6, 1:4] # Look at first 6 rows and first 4 columns

## ------------------------------------------------------------------------
example <- asciiSetupReader::spss_ascii_reader(dataset_name = dataset_name,
sps_name = sps_name, 
keep_columns = 1:2) # Gets only the first 2 columns
example[1:6, 1:2] # Look at first 6 rows and first 4 columns

## ------------------------------------------------------------------------
example <- asciiSetupReader::spss_ascii_reader(dataset_name = dataset_name,
sps_name = sps_name, 
keep_columns = c("IDENTIFIER_CODE", "NUMERIC_STATE_CODE")) # Gets only the first 2 columns
example[1:6, 1:2] # Look at first 6 rows and first 4 columns

