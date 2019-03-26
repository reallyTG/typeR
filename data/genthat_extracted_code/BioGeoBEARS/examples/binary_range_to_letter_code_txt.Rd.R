library(BioGeoBEARS)


### Name: binary_range_to_letter_code_txt
### Title: Convert binary presence/absence codes (1/0) to text area names
### Aliases: binary_range_to_letter_code_txt

### ** Examples

testval=1
tipranges_row = c(1, 0, 1, 0)
areanames = c("A", "B", "C", "D")
statename = binary_range_to_letter_code_txt(tipranges_row, areanames)
statename



