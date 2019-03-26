library(chron)


### Name: scale
### Title: Coordinates and Positions for Chronological Objects
### Aliases: chron_trans scale_x_chron scale_y_chron

### ** Examples

if(require("ggplot2")) {
    dd <- data.frame(tt = chron(1:10), value = 101:110)
    p <- ggplot(dd, aes(tt, value)) +
             geom_point() + scale_x_chron(format = "%m-%d")
    print(p)
}



