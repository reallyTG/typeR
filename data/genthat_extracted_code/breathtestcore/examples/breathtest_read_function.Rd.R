library(breathtestcore)


### Name: breathtest_read_function
### Title: Snoop method to read breath test file
### Aliases: breathtest_read_function

### ** Examples

 file = btcore_file("IrisCSV.TXT")
 # Get function to read this file. Returns \code{read_iris_csv}.
 read_fun = breathtest_read_function(file)
 str(read_fun(file))
 # or, simple (returns a list!)
 str(read_any_breathtest(file), 1 )
 



