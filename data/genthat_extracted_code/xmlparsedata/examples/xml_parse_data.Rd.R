library(xmlparsedata)


### Name: xml_parse_data
### Title: Convert R parse data to XML
### Aliases: xml_parse_data

### ** Examples

code <- "function(a = 1, b = 2) {\n  a + b\n}\n"
expr <- parse(text = code, keep.source = TRUE)

# The base R way:
getParseData(expr)

cat(xml_parse_data(expr, pretty = TRUE))



