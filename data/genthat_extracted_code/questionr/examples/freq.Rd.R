library(questionr)


### Name: freq
### Title: Generate frequency tables.
### Aliases: freq

### ** Examples

# factor
data(hdv2003)
freq(hdv2003$qualif)
freq(hdv2003$qualif, cum = TRUE, total = TRUE)
freq(hdv2003$qualif, cum = TRUE, total = TRUE, sort ="dec")

# labelled data
data(fecondite)
freq(femmes$region)
freq(femmes$region, levels = "l")
freq(femmes$region, levels = "v")



