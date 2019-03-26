library(stringi)


### Name: stri_datetime_symbols
### Title: List Localizable Date-Time Formatting Data
### Aliases: stri_datetime_symbols

### ** Examples

stri_datetime_symbols() # uses the Gregorian calendar in most locales
stri_datetime_symbols("@calendar=hebrew")
stri_datetime_symbols("he_IL@calendar=hebrew")
stri_datetime_symbols("@calendar=islamic")
stri_datetime_symbols("@calendar=persian")
stri_datetime_symbols("@calendar=indian")
stri_datetime_symbols("@calendar=coptic")
stri_datetime_symbols("@calendar=japanese")

stri_datetime_symbols("ja_JP_TRADITIONAL") # uses the Japanese calendar by default
stri_datetime_symbols("th_TH_TRADITIONAL") # uses the Buddhist calendar

stri_datetime_symbols("pl_PL", context="format")
stri_datetime_symbols("pl_PL", context="standalone")

stri_datetime_symbols(width="wide")
stri_datetime_symbols(width="abbreviated")
stri_datetime_symbols(width="narrow")




