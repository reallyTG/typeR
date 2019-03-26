library(MixedPsy)


### Name: PsychShape
### Title: Plotting Psychometric Functions given PSE and JND
### Aliases: PsychShape

### ** Examples

y = c(0,1)
x = c(-40, 40)
plot(y ~ x, type = "n", bty = "n", lab = c(5,3,7))
PsychShape(pse = 0, jnd = 6, x.range = c(-40, 40), ps.col = "gray", ps.lwd = 3)
PsychShape(pse = 6, jnd = 6, x.range = c(-40, 40), ps.col = "black")
PsychShape(pse = 6, jnd = 6, x.range = c(-40, 40), ps.col = "red", ps.link = "logit", ps.lwd = 3)




