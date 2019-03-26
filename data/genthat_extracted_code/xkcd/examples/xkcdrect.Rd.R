library(xkcd)


### Name: xkcdrect
### Title: Draw fuzzy rectangles
### Aliases: xkcdrect
### Keywords: manip

### ** Examples

volunteers <- data.frame(year=c(2007:2011),
                        number=c(56470, 56998,59686, 61783, 64251))
p <- ggplot() + xkcdrect(aes(xmin = year,
                             xmax= year +0.3,
                             ymin=number,
                             ymax = number + 3600),
                         volunteers,
                         fill="red", colour="black")
p



