library(taxize)


### Name: apg_lookup
### Title: Lookup in the APGIII taxonomy and replace family names
### Aliases: apg_lookup

### ** Examples

# New name found
apg_lookup(taxa = "Hyacinthaceae", rank = "family")
apg_lookup(taxa = "Poaceae", rank = "family")

# Name not found
apg_lookup(taxa = "Asteraceae", rank = "family")



