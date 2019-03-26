library(pxR)


### Name: as.px
### Title: Convert an array or a data.frame into an object of class px
### Aliases: as.px as.px.array as.px.data.frame
### Keywords: manip

### ** Examples


my.px.object  <- read.px(system.file("extdata", "example.px", package = "pxR"))
my.data       <- as.array(my.px.object)
my.px.object2 <- as.px(my.data)
my.px.object3 <- as.px(my.data, skeleton.px = my.px.object) 
my.px.object4 <- as.px(my.data, list.keys = list(MATRIX = "xxx", CONTENTS = "new data",
                             NEWKEY = "another key", UNITS = "people", TITLE = "My Title"))
                             
my.px.df      <- as.data.frame(my.px.object)
my.px.object5 <- as.px(my.px.df)



