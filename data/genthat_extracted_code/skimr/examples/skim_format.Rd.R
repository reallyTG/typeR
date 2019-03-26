library(skimr)


### Name: skim_format
### Title: Change the formatting options for printed skim objects
### Aliases: skim_format skim_format_defaults show_formats

### ** Examples

# Format numbers to have more digits
skim_format(numeric = list(digits = 3))

# Show the values for the formats
show_formats()

# Show 4-character names in factor levels
skim_format(.levels = list(max_char = 4))

# Set multiple formats
skim_format(numeric = list(digits = 3), .levels = list(max_char = 4))

# Set multiple formats with a .list argument
my_formats <- list(numeric = list(digits = 3), .levels = list(max_char = 4))
skim_format(.list = my_formats)

# Alternatively, use rlang unquoting semantics
skim_format(!!!my_formats)

# Reset to the defaults
skim_format_defaults()



