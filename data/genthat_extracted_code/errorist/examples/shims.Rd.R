library(errorist)


### Name: enable_warning_shim
### Title: Enable and Disable Warning or Error Capture
### Aliases: enable_warning_shim disable_warning_shim enable_error_shim
###   disable_error_shim

### ** Examples



# Default setup
enable_warning_shim()

# Some code ...

# Remove the shim
disable_warning_shim()

# Specify a search function
enable_warning_shim(warning_search_func = searcher::search_google)

# Some code ...

# Remove the shim
disable_warning_shim()

# Enable only the error shim
enable_error_shim()

# Some code ...

# Remove the shim
disable_error_shim()

# Specify a search function
enable_error_shim(error_search_func = searcher::search_google)

# Some code ...

# Remove the shim
disable_error_shim()



