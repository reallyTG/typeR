library(EpiCurve)


### Name: EpiCurve
### Title: Plot an Epidemic Curve
### Aliases: EpiCurve
### Keywords: ~kwd1 ~kwd2

### ** Examples

# library(Epicurve)
date <- seq(as.timeDate("2017-05-10 21:35:22"), as.timeDate("2017-05-12 06:15:12"), by="12 min")
val <- rep(1, length(date))
tri <- rep(c("Alive", "Died","Unknown"), length.out=length(date))
DF <- data.frame(date, val, tri)
names(DF) <- c("date","value", "tri")


EpiCurve(DF,
         date = "date",
         freq = "value",
         period = "hour",
         split = 4,
         cutvar = "tri",
         ylabel="Number of cases",
         xlabel= "From 2017-05-10 21:35:22 To 2017-05-12 06:15:12",
         title = "Epidemic Curve")




