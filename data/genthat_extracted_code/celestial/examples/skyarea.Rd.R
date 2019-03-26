library(celestial)


### Name: skyarea
### Title: Exact angular area calculator
### Aliases: skyarea
### Keywords: sky area

### ** Examples

#The GAMA survey areas:
G02area=skyarea(c(30.2,38.8),c(-10.25,-3.72))
G09area=skyarea(c(129,141),c(-2,3))
G12area=skyarea(c(174,186),c(-3,2))
G15area=skyarea(c(211.5,223.5),c(-2,3))
G23area=skyarea(c(338.1,351.9),c(-35,-30))

#Total GAMA survey area:
TotalGAMAarea=G02area+G09area+G12area+G15area+G23area
paste('The GAMA survey area is',round(TotalGAMAarea['area'],2),'sq. deg.')

#Future TACs note: this is less than 1% of the sky ;-)
paste('The GAMA survey area is',round(TotalGAMAarea['areafrac']*100,2),'% of the sky')



