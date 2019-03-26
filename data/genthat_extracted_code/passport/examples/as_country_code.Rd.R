library(passport)


### Name: as_country_code
### Title: Convert standardized country names to country codes
### Aliases: as_country_code

### ** Examples

# Codifies standardized names
as_country_code(c("US", "Taiwan", "Myanmar", "Kosovo", "South Korea"), from = "en")

# Translates codes; if passed a factor, returns a releveled one
as_country_code(factor(c("SAH", "PCN", "OMA", "JPN")),
                from = "fifa", to = "iso4217_3c")




