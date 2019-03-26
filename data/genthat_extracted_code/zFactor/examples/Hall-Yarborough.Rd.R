library(zFactor)


### Name: z.HallYarborough
### Title: Hall-Yarborough correlation
### Aliases: z.HallYarborough

### ** Examples

# get z value from a Tpr at Ppr
z.HallYarborough(pres.pr = 1.5, temp.pr = 2.0)
z.HallYarborough(pres.pr = 1.5, temp.pr = 1.1)

# for two given Tpr and Ppr vectors, find the calculated z points
ppr <- c(0.5, 1.5, 2.5, 3.5, 4.5, 5.5, 6.5)
tpr <- c(1.3, 1.5, 1.7, 2)
hy <- z.HallYarborough(pres.pr = ppr, temp.pr = tpr)
print(hy)



