library(BioGeoBEARS)


### Name: binary_ranges_to_letter_codes
### Title: Convert binary presence/absence codes (1/0) to a list of text
###   area names
### Aliases: binary_ranges_to_letter_codes

### ** Examples

testval=1
# Define a tipranges object
tipranges_object = define_tipranges_object()
tipranges_object

areanames = getareas_from_tipranges_object(tipranges_object)
areanames

letter_code_ranges = binary_ranges_to_letter_codes(tipranges=tipranges_object,
areanames)
letter_code_ranges



