library(re2r)


### Name: re2_replace
### Title: Replace matched patterns in a string.
### Aliases: re2_replace re2_replace_all

### ** Examples

# replace one or more b, prefer more
regexp = re2("b+")
re2_replace_all("yabba dabba doo", regexp,"d")
re2_replace("yabba dabba doo", "b+","d")

# trim string
pattern = "^\\s+|\\s+$"
re2_replace_all(c("  abc  "," this is "), pattern, "")

# mask the middle three digits of a US phone number
texts = c("415-555-1234",
          "650-555-2345",
          "(416)555-3456",
          "202 555 4567",
          "4035555678",
          "1 416 555 9292")

us_phone_pattern = re2("(1?[\\s-]?\\(?\\d{3}\\)?[\\s-]?)(\\d{3})([\\s-]?\\d{4})")

re2_replace(texts, us_phone_pattern, "\\1***\\3")

# show_regex(us_phone_pattern)




