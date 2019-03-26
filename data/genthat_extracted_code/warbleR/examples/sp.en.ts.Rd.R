library(warbleR)


### Name: sp.en.ts
### Title: Extract the spectral entropy across signals as a time series
### Aliases: sp.en.ts

### ** Examples

{
# set the temp directory
# setwd(tempdir())

#load data
data(list = c("Phae.long1", "Phae.long2",  "Phae.long3",  "Phae.long4","selec.table"))
writeWave(Phae.long2, "Phae.long2.wav") #save sound files 
writeWave(Phae.long1, "Phae.long1.wav")
writeWave(Phae.long3, "Phae.long3.wav") #save sound files 
writeWave(Phae.long4, "Phae.long4.wav")

# without clip edges
sp.en.ts(X = selec.table, threshold = 10, bp = NULL, clip.edges = FALSE, length.out = 10,
 type = "b", sp.en.range = c(-25, 10))

# with clip edges and length.out 10
sp.en.ts(X = selec.table, threshold = 10, bp = c(2, 12), clip.edges = TRUE, length.out = 10)

}




