library(RLeafAngle)


### Name: computeG
### Title: Compute the mean projection of unit leaf area on the plane
###   perpendicular to beam direction, namely, G parameter.
### Aliases: computeG

### ** Examples

angleZ<-c(4.5, 13.5, 22.5, 31.5, 40.5, 49.5, 58.5, 67.5, 76.5, 85.5)
angleA<-c(10,30,50,70,90,110,130,150,170,190,210,230,250,270,290,310,330,350)
sADis<-sysAziDis()
sZDis<-sphericalDis()
for(solarZenith in 10:80)
{
  print(computeG(angleZ,sZDis,angleA,sADis,solarZenith,40))
}




