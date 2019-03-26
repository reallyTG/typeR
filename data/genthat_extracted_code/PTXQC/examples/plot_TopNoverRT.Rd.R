library(PTXQC)


### Name: plot_TopNoverRT
### Title: Plot line graph of TopN over Retention time.
### Aliases: plot_TopNoverRT

### ** Examples

  data = data.frame(fc.raw.file = rep(letters[1:3], each=100),
                    rRT = seq(20, 120, length.out = 100),
                    topN = c(round(runif(100, min=3, max=5)),
                             round(runif(100, min=5, max=8)),
                             round(runif(100, min=1, max=3)))
                    )
  plot_TopNoverRT(data)




