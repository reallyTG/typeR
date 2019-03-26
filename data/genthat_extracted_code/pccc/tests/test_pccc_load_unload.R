# This script just does basic loading and unloading of the pccc library
#
###############################################################################
#
# run tests with Ctrl/Cmd + Shift + T or devtools::test()
# for manually running, execute
#   library(testthat)
context("PCCC - Loading and unloading Package")

expect_silent(library(pccc))

# Unloading shouldn't result in any errors or warnings
expect_silent(detach("package:pccc", unload=TRUE))
