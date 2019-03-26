library(states)


### Name: sfind
### Title: Lookup country codes or names
### Aliases: sfind

### ** Examples

# Works with either integer or strings
sfind(325)
sfind("ALG")
sfind("Algeria")

# Search strings are treated as regular expressions (see stringr::str_detect)
sfind("Germany")
sfind("German")



