library(BaMORC)


### Name: read_raw_file
### Title: Extracts data from a protein NMR experimental peak list.
###   'read_raw_file()' function reads in a user provided protein NMR
###   experimental peak list. It currently supports file format in csv, txt
###   with deliminator of comma, whitespace or semicolon. Note: please
###   don't leave space between sequence and chemical shifts data,
###   otherwise it will report error.
### Aliases: read_raw_file

### ** Examples

input_type = "ws" 
sample_file_path = system.file("extdata", "sample_input_ws.txt", package = "BaMORC")
head(read_raw_file(file_path=sample_file_path, delim="ws"))

input_type = "csv"
sample_file_path = system.file("extdata", "sample_input.csv", package = "BaMORC")
head(read_raw_file(file_path=sample_file_path, delim="comma"))
unlink("sample_input.csv")

input_type = "sc"
sample_file_path = system.file("extdata", "sample_input_sc.txt", package = "BaMORC")
head(read_raw_file(file_path=sample_file_path, delim="semicolon"))
unlink("sample_input_sc.txt")




