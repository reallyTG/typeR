library(extRemes)


### Name: hwmid
### Title: Heat Wave Magnitude Index
### Aliases: hwmid
### Keywords: methods

### ** Examples


data("CarcasonneHeat")

tiid <- CarcasonneHeat[2,]

jan1980 <- which(tiid == 19800101)
jan2003 <- which(tiid == 20030101)
dec2003 <- which(tiid == 20031231)
dec2011 <- which(tiid == 20111231)

Temp <- CarcasonneHeat[3, jan2003:dec2003] / 10
Tref <- CarcasonneHeat[3, jan1980:dec2011] / 10


##hwmid calculation
hwmidFr2003 <- hwmid(1980, Tref, 2003, Temp)
hwmiFr2003 <- hwmi(1980, Tref, 2003, Temp)

T30y25p <- hwmidFr2003$T30y25p
T30y75p <- hwmidFr2003$T30y75p
range30y <- (T30y75p - T30y25p)

#daymag<-(Temp[214:225]-hwmidFr2003$T30ymin)/(hwmidFr2003$T30ymax-hwmidFr2003$T30ymin)
#### Heat Wave occurred in Carcassonne, France, 2003

split.screen( rbind( c(0, 1, 0.6, 1), c(0, 0.5, 0, 0.6), c(0.5, 1, 0, 0.6) ) )
screen(1)
par( mar = c(2, 2, 2, 0) )
plot( c(1:365), Temp[1:365], xlim = c(190, 240), ylim = c(25, 50),
    xlab = "", ylab = "", cex.axis = 1.1, col = 8, font.axis = 2)

par( new = TRUE )
plot( c(150:270), hwmiFr2003$thr[150:270], type = "l",xlim = c(190, 240),
    ylim = c(25, 50), xlab = "", ylab = "", col = 1, lwd = 2, axes = FALSE)

par(new = TRUE)


plot(c(214:216), Temp[214:216], xlim = c(190, 240), ylim = c(25, 50),
    xlab = "", ylab = "", col = 4, type = "b", lwd = 2, axes = FALSE,
    pch = "a", cex = 1.2)

par( new = TRUE)
plot(c(217:219), Temp[217:219], xlim = c(190, 240), ylim = c(25,50),
    xlab = "", ylab = "", col = 4, type = "b", lwd = 2, axes = FALSE,
    pch = "b", cex = 1.2)

par(new=TRUE)
plot(c(220:222), Temp[220:222], xlim = c(190, 240), ylim = c(25, 50),
    xlab = "", ylab = "", col = 4, type = "b", lwd = 2, axes = FALSE,
    pch = "c", cex = 1.2)

par(new=TRUE)
plot(c(223:225), Temp[223:225], xlim = c(190, 240), ylim = c(25, 50),
    xlab = "", ylab = "", col = 4, type = "b", lwd = 2, axes = FALSE,
    pch = "d", cex = 1.2)


par(new=TRUE)
plot(c(214:216), (Temp[214:216]+5), xlim = c(190, 240), ylim = c(25, 50),
    xlab = "", ylab = "", col = 3, type = "b", lwd = 2, axes = FALSE,
    pch = "a", cex = 1.2)

par(new=TRUE)
plot(c(217:219), (Temp[217:219]+5), xlim = c(190, 240), ylim = c(25, 50),
    xlab = "", ylab = "", col = 3, type = "b", lwd = 2, axes = FALSE,
    pch = "b", cex = 1.2)

par(new=TRUE)
plot(c(220:222), (Temp[220:222]+5), xlim = c(190, 240), ylim = c(25, 50),
    xlab = "", ylab = "", col = 3, type = "b", lwd = 2, axes = FALSE,
    pch = "c", cex = 1.2)

par(new=TRUE)
plot(c(223:225), (Temp[223:225]+5), xlim = c(190, 240), ylim = c(25, 50),
    xlab = "", ylab = "", col = 3, type = "b", lwd = 2, axes = FALSE,
    pch = "d", cex = 1.2)

text(200, 50, "HW2", col = 3, font = 2)
text(200, 48, "HWMI=4", col = 3, font = 2)
text(200, 46, "HWMId = 41.9",col = 3, font = 2)

text(200, 42, "HW1", col = 4, font = 2)
text(200, 40, "HWMI = 3.68", col = 4, font = 2)
text(200, 38, "HWMId=18.6",col = 4, font = 2)


box()



