library(calendar)


### Name: properties
### Title: The key 'properties' that are allowed in ical files
### Aliases: properties
### Keywords: datasets

### ** Examples

# doc = ic_spec(mode = "read")
# key_locations = grepl(pattern = " \\| [A-Z]", x = doc)
# summary(key_locations)
# doc_key = doc[key_locations]
# # regexplain::regex_gadget(text = doc_key) # explore
# key_properties = grepl(pattern = "3.7|3.8", x = doc)
# doc_properties = doc[key_locations & key_properties]
# # regexplain::regex_gadget(text = doc_properties) # explore
# properties = regmatches(doc_properties, regexpr('[A-Z][A-Z]+', doc_properties))
# usethis::use_data(properties)



