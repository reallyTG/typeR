library(imager)


### Name: hough_line
### Title: Hough transform for lines
### Aliases: hough_line

### ** Examples


#Find the lines along the boundary of a square
px <- px.square(30,80,80) %>% boundary
plot(px)
#Hough transform
hough_line(px,ntheta=200) %>% plot

df <- hough_line(px,ntheta=800,data.frame=TRUE)
#Plot lines with the highest score
plot(px)
with(subset(df,score > quantile(score,.9995)),nfline(theta,rho,col="red"))

plot(boats)
df <- hough_line(boats,ntheta=800,data=TRUE)



