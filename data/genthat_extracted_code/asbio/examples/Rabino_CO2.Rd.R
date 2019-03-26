library(asbio)


### Name: Rabino_CO2
### Title: CSIRO d13C-CO2 data from Rubino et al., A revised 1000 year
###   atmospheric 13C-CO2 record from Law Dome and South Pole, Antarctica
### Aliases: Rabino_del13C Rabino_CO2
### Keywords: datasets

### ** Examples

data(Rabino_CO2)
data(Rabino_del13C)

op <- par(mar=c(5,4.5,1,4.5))
with(Rabino_del13C, plot(effective.age, 
d13C.CO2, xlab = "Year", type='p', 
col = 1, pch = 21, bg = 'red', ylab = ''))
axis(2, col = 'red', col.axis = 'red')
mtext(side = 2, expression(paste(delta,' ','
'^13,'C  (per mille)')), col = 'red', 
line = 3, cex = 1.2)
par(new = TRUE)

with(Rabino_CO2, plot(effective.age, 
CO2, type='p', col=1,pch = 21, 
bg = 'blue', axes = FALSE, xlab = "", ylab = ""))
axis(4, col = 'blue', col.axis = 'blue')
mtext(side=4,expression(paste('Atmospheric ', 
CO[2], ' (ppm)')), 
line = 3, col = 'blue', cex = 1.2)
par(op)



