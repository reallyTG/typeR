library(abjutils)


### Name: carf_calc_dig
### Title: Calculate check digit for CARF
### Aliases: carf_calc_dig

### ** Examples

{
carf_calc_dig("10120.008427/2003", build = TRUE)
carf_calc_dig("15374.002430/99", build = FALSE)
carf_calc_dig(c("101200084272003", "1537400243099"))
## No test: 
carf_calc_dig("10766.000511/96-12")
## End(No test)
}




