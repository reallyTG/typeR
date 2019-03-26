library(rysgran)


### Name: rysgran.hist
### Title: Histograms of Grain Size Data
### Aliases: rysgran.hist

### ** Examples


library(rysgran)
data(camargo2001)
data(sed.phi)

#histograms

rysgran.hist(camargo2001)


#histograms separated by factors

env<- rep(c("River","Tidal Flat","Subtidal","Beach"),each=10)
rysgran.hist(sed.phi, subset = env , which= "Subtidal")


#Making it more attractive

env<- rep(c("River","Tidal Flat","Subtidal","Beach"),each=10)
hist <- rysgran.hist(sed.phi, subset = env , which= "Subtidal")
hist

hist.up <- update(hist, aspect = .4,
    scales=list(x=list(cex=.7),y=list(cex=.7)),
    layout = c(2,5),
    between= list(x = c(0.2), y = c(0.2)),
    ylab = "Frequency",
    xlab = expression(paste(phi)),
    strip = strip.custom(bg = "lightblue"),
    col = "red",
    main="Histogram")
hist.up




