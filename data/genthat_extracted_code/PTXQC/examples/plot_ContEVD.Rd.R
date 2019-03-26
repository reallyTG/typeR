library(PTXQC)


### Name: plot_ContEVD
### Title: Plot contaminants from evidence.txt, broken down into
###   top5-proteins.
### Aliases: plot_ContEVD

### ** Examples


 data = data.frame(intensity = 1:12, 
                   pname = rep(letters[1:3], 4), 
                   fc.raw.file = rep(paste("f", 1:4), each=3),
                   contaminant = TRUE)
 ## providing more proteins than present... d,e will be ignored
 plot_ContEVD(data, top5 = letters[1:5])
 ## classify 'c' as 'other'
 plot_ContEVD(data, top5 = letters[1:2])




