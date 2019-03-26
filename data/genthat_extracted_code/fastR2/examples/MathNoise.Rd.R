library(fastR2)


### Name: MathNoise
### Title: Test performance and noise
### Aliases: MathNoise
### Keywords: datasets

### ** Examples


data(MathNoise)
xyplot (score ~ noise, data = MathNoise, group = group, type = 'a', 
		auto.key = list(columns = 2, lines = TRUE, points = FALSE))

gf_jitter(score ~ noise, data = MathNoise, color = ~ group, alpha = 0.4, 
          width = 0.1, height = 0) %>%
  gf_line(score ~ noise, data = MathNoise, color = ~ group, group = ~ group,
        stat = "summary")



