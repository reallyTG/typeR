library(painter)


### Name: SetOpacity
### Title: Modify the opacity, hue, saturation or value of color(s)
### Aliases: SetOpacity SetHue SetSaturation SetValue
### Keywords: color

### ** Examples

TestPalette(SetOpacity("red",seq(0,1,0.02)))
TestPalette(SetHue("red",seq(0,1,0.02)))
TestPalette(SetSaturation("red",seq(0,1,0.02)))
TestPalette(SetValue("red",seq(0,1,0.02)))

x = runif(200)
y = runif(200)
color = SetHue("red",x)
color = SetValue(color,y)
plot(x,y,col = color,pch = 16,cex = 2)




