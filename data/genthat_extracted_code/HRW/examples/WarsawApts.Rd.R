library(HRW)


### Name: WarsawApts
### Title: Apartment prices in Warsaw, Poland
### Aliases: WarsawApts

### ** Examples

library(HRW) ; data(WarsawApts)
x <- WarsawApts$construction.date
y <- WarsawApts$areaPerMzloty
plot(x,y,bty = "l",col = "dodgerblue")
if (require("mgcv"))
{
   fitGAMcr <- gam(y ~ s(x,bs = "cr",k = 30))
   xg <- seq(min(x),max(x),length = 1001)
   fHatgGAMcr <- predict(fitGAMcr,newdata = data.frame(x = xg))
   lines(xg,fHatgGAMcr,col = "darkgreen")
}



