library(mosaic)


### Name: relm
### Title: Resample a Linear Model
### Aliases: relm

### ** Examples

mod <- lm(length ~ width, data = KidsFeet)
do(1) * mod 
do(3) * relm(mod) 
# use residual resampling to estimate standard error (very crude because so few replications)
Boot <- do(100) * relm(mod)
sd(~ width, data = Boot)
# standard error as produced by summary() for comparison
mod %>% summary() %>% coef() 




