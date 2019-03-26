library(extRemes)


### Name: hwmi
### Title: Heat Wave Magnitude Index
### Aliases: hwmi
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

##hwmi calculation
hwmiFr2003 <- hwmi(1980, Tref, 2003, Temp)

#### Heat Wave occurred in Carcassonne, France, 2003

plot(c(150:270), Temp[150:270], xlim = c(150, 270),
    ylim = c((min(hwmiFr2003$thr[150:270]) - 
        sd(hwmiFr2003$thr[150:270])), max(Temp[150:270])),
    xlab = "days", ylab = "temperature", col = 8)

par(new = TRUE)
plot(c(150:270), hwmiFr2003$thr[150:270], type = "l",
    xlim = c(150,270),
    ylim = c((min(hwmiFr2003$thr[150:270]) - sd(hwmiFr2003$thr[150:270])),
    max(Temp)), xlab = "", ylab = "", col = 1, lwd = 2)

par(new = TRUE)
plot(c(hwmiFr2003$hwmi[1,3]:(hwmiFr2003$hwmi[1,3] + hwmiFr2003$hwmi[1,2]-1)),
    Temp[hwmiFr2003$hwmi[1,3]:(hwmiFr2003$hwmi[1,3] + hwmiFr2003$hwmi[1,2] - 1)],
    xlim = c(150,270),
    ylim = c((min(hwmiFr2003$thr[150:270]) - sd(hwmiFr2003$thr[150:270])),
        max(Temp[150:270])),
    xlab = "", ylab = "", col = 4, type = "b",
    main = "Carcassonne, France, 2003", lwd = 2)

text(175, 42, "hwmi = 3.68", col = 4, font = 2)
text(175, 41, "Duration = 12 days", col = 4, font = 2)
text(175, 40, "Starting day = 214 (02.Aug.2003)", col = 4, font = 2)





