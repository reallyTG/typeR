library(ore)


### Name: ore.dict
### Title: Get or set entries in the pattern dictionary
### Aliases: ore.dict ore_dict

### ** Examples

# Literal strings are returned as-is
ore.dict("protocol")

# Named arguments are added to the dictionary
ore.dict(protocol="\\w+://")

# ... and can be retrieved by name
ore.dict(protocol)




