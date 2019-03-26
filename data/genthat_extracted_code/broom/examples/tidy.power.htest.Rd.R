library(broom)


### Name: tidy.power.htest
### Title: Tidy a(n) power.htest object
### Aliases: tidy.power.htest

### ** Examples


ptt <- power.t.test(n = 2:30, delta = 1)
tidy(ptt)

library(ggplot2)

ggplot(tidy(ptt), aes(n, power)) +
  geom_line()




