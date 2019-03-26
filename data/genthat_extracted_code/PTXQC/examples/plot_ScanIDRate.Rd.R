library(PTXQC)


### Name: plot_ScanIDRate
### Title: Plot line graph of TopN over Retention time.
### Aliases: plot_ScanIDRate

### ** Examples

  data = data.frame(fc.raw.file = factor(rep(c("d","a","x"), each=10), levels = c("d","a","x")),
                    scan.event.number = 1:10,
                    ratio = seq(40, 20, length.out=10),
                    count = seq(400, 200, length.out=10))
  plot_ScanIDRate(data)




