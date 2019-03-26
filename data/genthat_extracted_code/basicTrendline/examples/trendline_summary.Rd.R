library(basicTrendline)


### Name: trendline_summary
### Title: Summarized Results of Each Regression Model
### Aliases: trendline_summary

### ** Examples

library(basicTrendline)
x1<-1:5
x2<- -2:2
x3<- c(101,105,140,200,660)
x4<- -5:-1
x5<- c(1,30,90,180,360)

y1<-c(2,14,18,19,20)        # increasing convex trend
y2<- c(-2,-14,-18,-19,-20)  # decreasing concave trend
y3<-c(2,4,16,38,89)         # increasing concave trend
y4<-c(-2,-4,-16,-38,-89)    # decreasing convex trend
y5<- c(600002,600014,600018,600019,600020) # high y values with low range.

trendline_summary(x1,y1,model="line2P",summary=TRUE,eDigit=10)
trendline_summary(x2,y2,model="line3P",summary=FALSE)
trendline_summary(x3,y3,model="log2P")
trendline_summary(x4,y4,model="exp3P")
trendline_summary(x5,y5,model="power3P")




