library(PMwR)


### Name: is_valid_ISIN
### Title: Validate International Securities Identification Numbers (ISINs)
### Aliases: is_valid_ISIN

### ** Examples

isin <- c("US0378331005", "AU0000XVGZA3",
          "DE000A0C3743", "not_an_isin")
is_valid_ISIN(isin)

is_valid_ISIN(c("US0378331005",
                "us0378331005")) ## case is ignored



