library(textshape)


### Name: split_match_regex_to_transcript
### Title: Split Text by Regex Into a Transcript
### Aliases: split_match_regex_to_transcript

### ** Examples

## Not run: 
##D system.file(
##D     "docs/Simpsons_Roasting_on_an_Open_Fire_Script.pdf", 
##D     package = "textshape"
##D ) %>%
##D     textreadr::read_document() %>%
##D     split_match_regex_to_transcript("^[A-Z]{3,}", skip = 2)
## End(Not run)




