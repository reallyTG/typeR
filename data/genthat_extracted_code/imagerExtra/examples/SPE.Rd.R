library(imagerExtra)


### Name: SPE
### Title: Correct inhomogeneous background of image by solving Screened
###   Poisson Equation
### Aliases: SPE

### ** Examples

dev.new()
par(mfcol = c(1,2))
boats_g <- grayscale(boats)
plot(boats_g, main = "Original")
SPE(boats_g, 0.1) %>% plot(main = "Screened Poisson Equation")



