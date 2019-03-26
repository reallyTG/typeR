library(enc)


### Name: encoding
### Title: Encoding information
### Aliases: encoding all_utf8

### ** Examples

encoding("a")
encoding("\u00fc")
all_utf8(enc2utf8(c("a", "\u00fc")))

# Platform-dependent:
all_utf8(enc2native(c("a", "\u00fc")))



