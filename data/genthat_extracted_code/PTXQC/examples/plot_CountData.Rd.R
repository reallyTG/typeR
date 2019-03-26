library(PTXQC)


### Name: plot_CountData
### Title: Plot Protein groups per Raw file
### Aliases: plot_CountData

### ** Examples


 data = data.frame(fc.raw.file = rep(c("file A", "file B"), each=3),
                   counts = c(3674, 593, 1120, 2300, 400, 600), 
                   category = c("genuine","genuine+transferred","transferred"))
 plot_CountData(data, 6000, 4000, c("EVD: Protein Groups count", "gain: 23%"))




