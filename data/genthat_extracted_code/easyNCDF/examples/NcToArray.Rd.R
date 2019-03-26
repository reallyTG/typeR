library(easyNCDF)


### Name: NcToArray
### Title: Read a NetCDF File Into an R Array
### Aliases: NcToArray nc2a
### Keywords: datagen

### ** Examples

# Create an array from R
file_path <- tempfile(fileext = '.nc')
a <- array(1:9, dim = c(member = 3, time = 3))
# Store into a NetCDF twice, as two different variables
ArrayToNc(list(var_1 = a, var_2 = a + 1), file_path)
# Read the dimensions and variables in the created file
fnc <- NcOpen(file_path)
fnc_dims <- NcReadDims(fnc)
var_names <- NcReadVarNames(fnc)
# Read the two variables from the file into an R array
a_from_file <- NcToArray(fnc, vars_to_read = var_names)
NcClose(fnc)
# Check the obtained array matches the original array
print(a)
print(a_from_file[1, , ])

# Example with extra dimensions of length 1
# Creating sample data with singleton dimensions. Only dimensions 'a', 'b' and
# 'c' are of length > 1.
test_var <- array(1:24, dim = c(1, 1, 2, 1, 1, 3, 1, 4, 1, 1))
names(dim(test_var)) <- c('x', 'y', 'a', 'z', 't', 'b', 'u', 'c', 'v', 'w')
# Storing the data into a NetCDF file
a2nc(list(test_var = test_var), file_path)
# Reading the data back
fff <- nc2a(file_path, list(a = NA, b = NA, c = NA), vars_to_read = 'test_var')
# By default, if no indices are provided for the singleton dimensions, they are 
# automatically read in and preserved
dim(fff)
# Reading the data back with expect_all_indices = TRUE
fff <- nc2a(file_path, list(a = NA, b = NA, c = NA), vars_to_read = 'test_var', 
            expect_all_indices = TRUE)
# If indices for all dimensions are not provided and expect_all_indices = TRUE, 
# the function crashes, except if those dimensions are of length 1. In that 
# case, the function ignores those (those are dropped)
dim(fff)



