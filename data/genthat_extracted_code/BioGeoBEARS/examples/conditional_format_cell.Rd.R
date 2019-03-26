library(BioGeoBEARS)


### Name: conditional_format_cell
### Title: Conditionally format a number (mostly)
### Aliases: conditional_format_cell

### ** Examples

test=1

cellval = 143514514514532
conditional_format_cell(cellval)

cellval = -42.235235
conditional_format_cell(cellval)

cellval = -42.0000000
conditional_format_cell(cellval)

cellval = 0.0000
conditional_format_cell(cellval)

cellval = 0.0001
conditional_format_cell(cellval)

cellval = 0.00001
conditional_format_cell(cellval)

cellval = 0.0000111
conditional_format_cell(cellval)



