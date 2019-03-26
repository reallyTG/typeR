library(PASWR)


### Name: SBIQ
### Title: County IQ
### Aliases: SBIQ
### Keywords: datasets

### ** Examples

with(data = SBIQ, qqnorm(County1))
with(data = SBIQ, qqline(County1))
# Trellis Approach
qqmath(~County1, data = SBIQ, type=c("p","r"))



