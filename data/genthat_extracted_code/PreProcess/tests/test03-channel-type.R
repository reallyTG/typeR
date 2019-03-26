# channel-type-test.ssc
library(PreProcess)

x <- ChannelType('Affymetrix', 'oligo', 100, 100, 'fluor')
x
print(x)
summary(x)

y <- setDesign(x, 'fake.design')
y
summary(y)
d <- getDesign(y)
d

rm(d, x, y)
