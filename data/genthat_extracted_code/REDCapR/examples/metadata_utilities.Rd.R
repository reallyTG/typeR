library(REDCapR)


### Name: metadata_utilities
### Title: Manipulate and interpret the metadata of a REDCap project.
### Aliases: metadata_utilities regex_named_captures checkbox_choices
###   checkbox_choices

### ** Examples

library(REDCapR) #Load the package into the current R session.
#The weird ranges are to avoid the pipe character; PCRE doesn't support character negation.
pattern_boxes <- "(?<=\\A| \\| )(?<id>\\d{1,}), (?<label>[\x20-\x7B\x7D-\x7E]{1,})(?= \\| |\\Z)"

choices_1 <- paste0(
  "1, American Indian/Alaska Native | ",
  "2, Asian | ",
  "3, Native Hawaiian or Other Pacific Islander | ",
  "4, Black or African American | ",
  "5, White | ",
  "6, Unknown / Not Reported")

#This calls the general function, and requires the correct regex pattern.
regex_named_captures(pattern=pattern_boxes, text=choices_1)

#This function is designed specifically for the checkbox values.
checkbox_choices(select_choices=choices_1)

## Not run: 
##D uri         <- "https://bbmc.ouhsc.edu/redcap/api/"
##D token       <- "9A81268476645C4E5F03428B8AC3AA7B"
##D 
##D ds_metadata <- redcap_metadata_read(redcap_uri=uri, token=token)$data
##D choices_2   <- ds_metadata[ds_metadata$field_name=="race", "select_choices_or_calculations"]
##D 
##D regex_named_captures(pattern=pattern_boxes, text=choices_2)
## End(Not run)



