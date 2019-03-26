library(readtext)


### Name: readtext_options
### Title: Get or set package options for readtext
### Aliases: readtext_options

### ** Examples

## No test: 
# save the current options
(opt <- readtext_options())

# set higher verbosity
readtext_options(verbosity = 3)

# read something in here
DATA_DIR <- system.file("extdata/", package = "readtext")
readtext(paste0(DATA_DIR, "txt/UDHR/*"))

# reset to saved options
readtext_options(opt)
## End(No test)



