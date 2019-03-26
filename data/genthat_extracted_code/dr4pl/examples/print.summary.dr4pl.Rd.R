library(dr4pl)


### Name: print.summary.dr4pl
### Title: Print the dr4pl object summary to screen.
### Aliases: print.summary.dr4pl

### ** Examples

library(drc)  # Needed for the data set 'ryegras'
dr4pl.ryegrass <- dr4pl(rootl ~ conc, data = ryegrass)
print(summary(dr4pl.ryegrass))

dr4pl.7 <- dr4pl(Response ~ Dose, data = sample_data_7)
print(summary(dr4pl.7))



