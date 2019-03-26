library(docxtools)


### Name: format_engr
### Title: Format numerical variables in engineering notation.
### Aliases: format_engr

### ** Examples

# Factors unaffected; ambiguous trailing zeros.
data("CO2")
x <- head(CO2, n = 5L)
format_engr(x)
format_engr(x, sigdig = c(0, 3))
format_engr(x, sigdig = c(3, 3), ambig_0_adj = TRUE)

# Ordered factor unaffected; ambiguous trailing zeros.
data("DNase")
x <- tail(DNase, n = 5L)
format_engr(x)
format_engr(x, sigdig = c(6, 3))
format_engr(x, sigdig = c(6, 3), ambig_0_adj = TRUE)

# Integers returned unchanged but delimited; NA unchanged.
data("airquality")
x <- head(airquality, n = 6L)
format_engr(x, sigdig = 3)




