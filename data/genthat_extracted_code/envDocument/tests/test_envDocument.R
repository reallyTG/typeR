# test_envDocument
# 
# Note: I'm not sure how to run a true regression test on this package since its
# purpose is to print out a lot of machine-specific info.  For now just make
# sure it outupts the appropriate sections (system, Rversion and included package envDocument)

library(envDocument)

# Calling env_doc with defaults returns a single data frame of information
# about the environment
info <- env_doc()

# Call with output = "print" will print the data frame
env_doc("print")

# Call with output = "table" to pretty-print each section with knitr::kable
# set results to 'asis' to avoid prefixing output

#+ env_table, results = "asis"
env_doc("table")

# change to trigger git status
message("Done")
