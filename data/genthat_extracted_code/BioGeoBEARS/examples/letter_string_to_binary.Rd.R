library(BioGeoBEARS)


### Name: letter_string_to_binary
### Title: Convert ranges in the form of letters (A, AB, BFG, etc.) to
###   binary state number codes
### Aliases: letter_string_to_binary

### ** Examples

testval=1
letter_string = "ABD"
letter_string_to_binary(letter_string, letter_codes_in_desired_order="alphabet")

letter_string = "ABD"
letter_string_to_binary(letter_string,
letter_codes_in_desired_order=c("A","B","C","D","E","F"))

letter_string = "ABD"
letter_string_to_binary(letter_string,
letter_codes_in_desired_order=strsplit("ABCDEF", split="")[[1]])



