library(imagerExtra)


### Name: BalanceSimplest
### Title: Balance color of image by Simplest Color Balance
### Aliases: BalanceSimplest

### ** Examples

dev.new()
par(mfcol = c(1,2))
boats_g <- grayscale(boats)
plot(boats_g, main = "Original")
BalanceSimplest(boats_g, 1, 1) %>% plot(., main = "Simplest Color Balance")



