library(PASWR2)


### Name: EPIDURAL
### Title: Traditional Sitting Position Versus Hamstring Stretch Position
### Aliases: EPIDURAL
### Keywords: datasets

### ** Examples

xtabs(~ doctor + ease, data = EPIDURAL)
xtabs(~ doctor + factor(ease, levels = c("Easy", "Difficult", "Impossible")), 
data = EPIDURAL)



