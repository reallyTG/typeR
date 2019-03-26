library(VGAM)


### Name: logitoffsetlink
### Title: Logit-with-an-Offset Link Function
### Aliases: logitoffsetlink
### Keywords: math models regression

### ** Examples

p <- seq(0.05, 0.99, by = 0.01); myoff <- 0.05
logitoffsetlink(p, myoff)
max(abs(logitoffsetlink(logitoffsetlink(p, myoff),
                        myoff, inverse = TRUE) - p))  # Should be 0



