library(MCAvariants)


### Name: plot.MCAvariants
### Title: Main plot function for classical and ordered multiple
###   correspondence analysis
### Aliases: plot.MCAvariants
### Keywords: graphical

### ** Examples

data(satisfaction)
ris1=MCAvariants(satisfaction, catype = "mca")
plot.MCAvariants(ris1)
print.MCAvariants(ris1)
ris2=MCAvariants(satisfaction, catype = "omca")
plot.MCAvariants(ris2)
print.MCAvariants(ris2)



