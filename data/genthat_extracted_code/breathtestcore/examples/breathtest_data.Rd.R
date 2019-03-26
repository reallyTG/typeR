library(breathtestcore)


### Name: breathtest_data
### Title: Data structure with PDR data and descriptors for breath test
###   records
### Aliases: breathtest_data

### ** Examples

# Read a file with known format
iris_csv_file = btcore_file("IrisCSV.TXT")
iris_csv_data = read_iris_csv(iris_csv_file)
# Note that many filds are NA
str(iris_csv_data)
# Convert to a format that can be fed to one of the fit functions
iris_df = cleanup_data(iris_csv_data)
# Individual curve fit
coef(nls_fit(iris_df)) 



