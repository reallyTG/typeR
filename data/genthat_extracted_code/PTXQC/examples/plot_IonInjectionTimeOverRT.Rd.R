library(PTXQC)


### Name: plot_IonInjectionTimeOverRT
### Title: Plot line graph of TopN over Retention time.
### Aliases: plot_IonInjectionTimeOverRT

### ** Examples

  data = data.frame(fc.raw.file = rep(c("d","a","x"), each=100),
                    rRT = seq(20, 120, length.out = 100),
                    medIIT = c(round(runif(100, min=3, max=5)),
                               round(runif(100, min=5, max=8)),
                               round(runif(100, min=1, max=3)))
                    )
  stats = data.frame(fc.raw.file = c("d","a","x"),
                     mean = c(4, 6.5, 2))
  plot_IonInjectionTimeOverRT(data, stats, 10)




