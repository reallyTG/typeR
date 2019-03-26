library(EngrExpt)


### Name: yellow
### Title: Initial and 1 month color measure of coated lens
### Aliases: yellow
### Keywords: datasets

### ** Examples

str(yellow)
show(plt1 <- xyplot(b2 ~ b1, yellow, aspect = 'iso', type = c("g","p"),
                    xlab = "Initial color measure of lens",
                    ylab = "Color measure after 1 month"))
show(tmd(plt1))



