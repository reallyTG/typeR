library(BENMMI)


### Name: benmmi
### Title: Perform BENMMI Analysis
### Aliases: benmmi BENMMI

### ** Examples


## No test: 
# This example illustrates a typical use case of the BENMMI-package.
# Note: execution may take several minutes.
# See the package vignette for more advanced examples and details. 

if (interactive()) {

# Create a work directory (in this example, a temporary
# directory, but in real use cases a persistent directory 
# will obviously be more useful).
my_dir <- tempfile("benmmi-example")
dir.create(my_dir)

# Populate this directory with simple use cases 
# (see the package-vignette for details).
# Most users will probably use one of these use cases as a 
# template for their own study.
BENMMIdir(my_dir)

# Run BENMMI given the settings in "settings-S-D-lin.json". This file
# relates to one of the predefined use cases. 
my_settings_file <- file.path(my_dir, "settings-S-D-lin.json")
benmmi(my_settings_file, browse = FALSE)

# The output (HTML-report and data-files) is stored in 'my_dir'
# and described in the package-vignette and resulting HTML-report itself.
# It is also possible to directly view the generated
# HTML-report by setting the browse-argument of the benmmi-function to TRUE.
}
## End(No test)



