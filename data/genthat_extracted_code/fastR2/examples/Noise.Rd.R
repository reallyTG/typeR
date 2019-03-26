library(fastR2)


### Name: Noise
### Title: Noise
### Aliases: Noise
### Keywords: datasets

### ** Examples


data(Noise)
Noise2 <- Noise %>% filter(volume != 'none')
model <- lm(score ~ volume * frequency, data = Noise2) 
anova(model)
gf_jitter(score ~ volume, data = Noise2, color = ~ frequency, 
          alpha = 0.4, width = 0.1, height = 0) %>%
  gf_line(score ~ volume, data = Noise2, group = ~frequency, color = ~ frequency,
          stat = "summary")
        
gf_jitter(score ~ frequency, data = Noise2, color = ~ volume, 
          alpha = 0.4, width = 0.1, height = 0) %>%
  gf_line(score ~ frequency, data = Noise2, group = ~ volume, color = ~ volume,
          stat = "summary")




