library(BSDA)


### Name: Stamp
### Title: Thicknesses of 1872 Hidalgo stamps issued in Mexico
### Aliases: Stamp
### Keywords: datasets

### ** Examples


hist(Stamp$thickness, freq = FALSE, col = "lightblue", 
     main = "", xlab = "stamp thickness (mm)")
lines(density(Stamp$thickness), col = "blue")
t.test(Stamp$thickness, conf.level = 0.99)




