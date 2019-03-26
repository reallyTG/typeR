library(jstor)


### Name: jst_get_references
### Title: Extract all references
### Aliases: jst_get_references

### ** Examples

jst_get_references(jst_example("article_with_references.xml"))

# import parsed references
jst_get_references(
  jst_example("parsed_references.xml"),
  parse_refs = TRUE
) 



