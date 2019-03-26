library(fmsb)


### Name: PrefYLL2015
### Title: Years of Life Lost by several causes in Japan 2015 for each
###   prefecture
### Aliases: PrefYLL2015
### Keywords: datasets

### ** Examples

require(fmsb)
x <- PrefYLL2015
COL <- ifelse(x$PNAME=="Nagano", "blue", ifelse(x$PNAME=="Okinawa", "pink", 
              ifelse(x$PNAME=="Shiga", "green", "lightgrey")))
LWD <- ifelse(x$PNAME=="Nagano", 2, ifelse(x$PNAME=="Okinawa", 2, ifelse(x$PNAME=="Shiga", 2, 1)))
LTY <- ifelse(x$PNAME=="Nagano", 1, ifelse(x$PNAME=="Okinawa", 1, ifelse(x$PNAME=="Shiga", 1, 3)))
VX <- c("Cancer","Heart\n Disease","Cerebrovascular\n Disease","Pneumonia",
 "Accident","(Traffic\n Accident)","Suicide","Kidney\n Failure","Liver\n Disease",
 "Diabetes","Hypertension","Tuberculosis")
males <- x[,3:14]
females <- x[,15:26]
layout(t(1:2))
radarchart(males, maxmin=FALSE, pcol=COL, axistype=2, pty=32, plty=LTY, plwd=LWD, vlabels=VX,
 title="YLLs in males (2015)\n (Blue: Nagano, Green: Shiga,\n Pink: Okinawa, Gray: Others)")
radarchart(females, maxmin=FALSE, pcol=COL, axistype=2, pty=32, plty=LTY, plwd=LWD, vlabels=VX,
 title="YLL in females (2015)\n (Blue: Nagano, Green: Shiga,\n Pink: Okinawa, Gray: Others)")


