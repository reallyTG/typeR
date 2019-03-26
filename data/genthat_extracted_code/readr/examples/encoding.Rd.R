library(readr)


### Name: guess_encoding
### Title: Guess encoding of file
### Aliases: guess_encoding

### ** Examples

guess_encoding(readr_example("mtcars.csv"))
guess_encoding(read_lines_raw(readr_example("mtcars.csv")))
guess_encoding(read_file_raw(readr_example("mtcars.csv")))

guess_encoding("a\n\u00b5\u00b5")



