library(fastR2)


### Name: Step
### Title: Stepping experiment
### Aliases: Step
### Keywords: datasets

### ** Examples


data(Step)
gf_jitter(HR-restHR ~ freq, color = ~height, data = Step, group = ~height,
          height = 0, width = 0.1) %>%
  gf_line(stat = "summary", group = ~height)
gf_jitter(HR-restHR ~ height, color = ~freq, data = Step, group = ~freq,
          height = 0, width = 0.1) %>%
  gf_line(stat = "summary", group = ~freq)



