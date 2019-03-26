library(PreProcess)


### Name: ChannelType-class
### Title: Class "ChannelType"
### Aliases: ChannelType-class ChannelType print,ChannelType-method
###   show,ChannelType-method summary,ChannelType-method setDesign
###   getDesign
### Keywords: classes manip

### ** Examples

showClass("ChannelType")

x <- ChannelType('Affymetrix', 'oligo', 100, 100, 'fluor')
x
print(x)
summary(x)

y <- setDesign(x, 'fake.design')
print(y)
summary(y)
d <- getDesign(y)
d

rm(d, x, y) # cleanup



