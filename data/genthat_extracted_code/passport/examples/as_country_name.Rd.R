library(passport)


### Name: as_country_name
### Title: Convert standardized country codes to country names
### Aliases: as_country_name

### ** Examples

# Usable names for tough-to-standardize places
as_country_name(c("US", "TW", "MM", "XK", "KR"))

# If passed a factor, will return a releveled one
as_country_name(factor(c("US", "NF", "CD", "SJ")), short = FALSE, variant = TRUE)

# Speaks a lot of languages, knows a lot of codes
as_country_name(c("SAH", "PCN", "OMA", "JPN"), from = "fifa", to = "cy")    # to Welsh




