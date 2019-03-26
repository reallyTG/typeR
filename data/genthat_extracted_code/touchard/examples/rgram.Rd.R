library(touchard)


### Name: rgram
### Title: Tukey's (hanging, standing, suspended) Rootogram for Assessing a
###   Touchard Model Fit
### Aliases: rgram rgram.toufit rgram.toureg
### Keywords: rootogram

### ** Examples

data(Epilepsy)
seiz <- seizures
fm <- toufit( seiz )
rgram(fm)

data(Accidents)
acc <- within(subset(Accidents, subset=Year==2013), {
FriSat <- ifelse(WeekDay > 5, 1, 0)
Spring <- ifelse(Season == "Spring", 1, 0)
})
fmTraff <- toureg( Y ~ FriSat + Spring, data = acc )
rgram(fmTraff)




