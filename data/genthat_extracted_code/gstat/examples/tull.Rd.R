library(gstat)


### Name: tull
### Title: Südliche Tullnerfeld data set
### Aliases: tull TULLNREG tull36 Chlorid92
### Keywords: datasets

### ** Examples

data(tull)

# TULLNREG = read.csv("TULLNREG.csv")

# I modified tulln36des.csv, such that the first line only contained: x,y
# resulting in row.names that reflect the station ID, as in
# tull36 = read.csv("tulln36des.csv")

# Chlorid92 was read & converted by:
#Chlorid92=read.csv("Chlorid92.csv")
#Chlorid92$Datum = as.POSIXct(strptime(Chlorid92$Datum, "%d.%m.%y"))

summary(tull36)
summary(TULLNREG)
summary(Chlorid92)

# stack & join data to x,y,Date,Chloride form:
cl.st = stack(Chlorid92[-1])
names(cl.st) = c("Chloride", "Station")
cl.st$Date = rep(Chlorid92$Datum, length(names(Chlorid92))-1)
cl.st$x = tull36[match(cl.st[,"Station"], row.names(tull36)), "x"]
cl.st$y = tull36[match(cl.st[,"Station"], row.names(tull36)), "y"]
# library(lattice)
# xyplot(Chloride~Date|Station, cl.st)
# xyplot(y~x|Date, cl.st, asp="iso", layout=c(16,11))
summary(cl.st)
plot(TULLNREG, pch=3, asp=1)
points(y~x, cl.st, add=TRUE, pch=16)



