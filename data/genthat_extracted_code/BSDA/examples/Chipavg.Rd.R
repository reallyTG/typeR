library(BSDA)


### Name: Chipavg
### Title: Measurements of the thickness of the oxide layer of manufactured
###   integrated circuits
### Aliases: Chipavg
### Keywords: datasets

### ** Examples


EDA(Chipavg$thickness)
t.test(Chipavg$thickness, mu = 1000)
boxplot(Chipavg$wafer1, Chipavg$wafer2, name = c("Wafer 1", "Wafer 2"))
shapiro.test(Chipavg$wafer1)
shapiro.test(Chipavg$wafer2)
t.test(Chipavg$wafer1, Chipavg$wafer2, var.equal = TRUE)




