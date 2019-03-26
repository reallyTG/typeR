library(BioGeoBEARS)


### Name: letter_strings_to_tipranges_df
### Title: Convert ranges in the form of letters (A, AB, BFG, etc.) to a
###   'tipranges' object
### Aliases: letter_strings_to_tipranges_df

### ** Examples

testval=1
letter_strings = c("A", "B", "C", "AB", "AC", "BC", "ABC")
letter_strings_to_tipranges_df(letter_strings)

letter_strings = c("A", "B", "C", "AB", "AC", "BC", "ABC")
letter_strings_to_tipranges_df(letter_strings,
tipnames_in_order=paste("tip", seq(1,7), sep=""))



