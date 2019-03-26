library(TLMoments)


### Name: TLMoment
### Title: Trimmed L Moments
### Aliases: TLMoment

### ** Examples

x <- rnorm(100)
TLMoment(x, order = 1)
TLMoment(x, order = 2, leftrim = 0, rightrim = 1)
TLMoment(x, order = c(1, 2, 3), leftrim = 2, rightrim = 2)
TLMoment(x, order = c(1, 3, 2), leftrim = 2, rightrim = 2)



