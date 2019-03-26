library(easySVG)


### Name: lim.axis.svg
### Title: Generate SVG element of axis
### Aliases: lim.axis.svg

### ** Examples

lim.axis.1 <- lim.axis.svg(x = c(100, 900), id = "test")
pack_info_1 <- pack.svg(pack.content = lim.axis.1)
# You can write it in a svg file
# message(pack_info_1)

lim.axis.2 <- lim.axis.svg(x = c(3.3, 4,5), id = "test", unit = 4000, axis.font.size = 4)
pack_info_2 <- pack.svg(pack.content = lim.axis.2)
# You can write it in a SVG file
# message(pack_info_2)




