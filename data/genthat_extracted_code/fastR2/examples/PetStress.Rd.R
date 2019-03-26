library(fastR2)


### Name: PetStress
### Title: Pets and stress
### Aliases: PetStress
### Keywords: datasets

### ** Examples


data(PetStress)
xyplot(rate ~ group, data = PetStress, jitter.x = TRUE, type = c('p', 'a'))
gf_jitter(rate ~ group, data = PetStress, width = 0.1, height = 0) %>%
  gf_line(group = 1, stat = "summary", color = "red")




