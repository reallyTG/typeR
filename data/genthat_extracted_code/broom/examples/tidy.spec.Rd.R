library(broom)


### Name: tidy.spec
### Title: Tidy a(n) spec object
### Aliases: tidy.spec

### ** Examples


spc <- spectrum(lh)
tidy(spc)

library(ggplot2)
ggplot(tidy(spc), aes(freq, spec)) +
  geom_line()




