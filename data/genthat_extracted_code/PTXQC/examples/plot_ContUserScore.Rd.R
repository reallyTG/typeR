library(PTXQC)


### Name: plot_ContUserScore
### Title: Plot Andromeda score distribution of contaminant peptide vs.
###   matrix peptides.
### Aliases: plot_ContUserScore

### ** Examples


 data = data.frame(x = 10:60,
                   y = c(seq(0,1,length=51), seq(0.1, 1, length=51)), 
                   condition = rep(c("sample","contaminant"), each=51))
 plot_ContUserScore(data, 'test file', 0.96)




