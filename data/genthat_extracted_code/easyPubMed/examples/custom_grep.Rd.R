library(easyPubMed)


### Name: custom_grep
### Title: Retrieve Text Between XML Tags
### Aliases: custom_grep

### ** Examples

#
# extract substrings based on regular expressions
string_01 <- "I can't wait to watch the <strong>Late Night Show with" 
string_01 <- paste(string_01, "Seth Meyers</strong> tonight at <strong>11:30</strong>pm CT!")
custom_grep(xml_data = string_01, tag = "strong", format = "char")
custom_grep(xml_data = string_01, tag = "strong", format = "list")



