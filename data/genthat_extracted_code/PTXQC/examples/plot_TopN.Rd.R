library(PTXQC)


### Name: plot_TopN
### Title: Plot line graph of TopN over Retention time.
### Aliases: plot_TopN

### ** Examples

  data = data.frame(fc.raw.file = rep(c("d","a","x"), each=10),
                    scan.event.number = 1:10,
                    n = 11:20)
  plot_TopN(data)




