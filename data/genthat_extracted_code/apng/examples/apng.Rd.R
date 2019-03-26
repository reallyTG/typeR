library(apng)


### Name: apng
### Title: Convert static pngs to animated png
### Aliases: apng

### ** Examples

png(filename="1.png", type="cairo-png")
plot(1:40, (1:40)^2)
dev.off()
png(filename="2.png", type="cairo-png")
plot(1:40, (-1*1:40)^3)
dev.off()
apng(c("1.png", "2.png"))



