library(nlsMicrobio)


### Name: competitioncurve
### Title: Growth kinetics of two competitive bacterial flora
### Aliases: competitioncurve competition1 competition2
### Keywords: datasets

### ** Examples

data(competition1)
data(competition2)
def.par <- par(no.readonly = TRUE)
par(mfrow = c(1,2))
twocolors <- c("red","blue")
plot(competition1$t,competition1$LOG10N,col=twocolors[competition1$flora])
plot(competition2$t,competition2$LOG10N,col=twocolors[competition2$flora])
par(def.par)



