library(BioGeoBEARS)


### Name: binary_range_to_letter_code_list
### Title: Convert binary presence/absence codes (1/0) to a list of text
###   area names
### Aliases: binary_range_to_letter_code_list

### ** Examples

testval=1
tipranges_row = c(1, 0, 1, 0)
areanames = c("A", "B", "C", "D")
list_of_areas_in_the_state = binary_range_to_letter_code_list(tipranges_row,
areanames)
list_of_areas_in_the_state



