library(wvtool)


### Name: glcm
### Title: Gray Level Co-occurence Matrix (glcm)
### Aliases: glcm

### ** Examples

data(camphora)
img <- camphora
par(mfrow=c(1,2))
lev <- 4
theta <- c(1,3)  # "th_0","th_90"
theta_c <-c("th_0","th_90")
dist <- 1
for (i in 1:2) {
	tst <- glcm(img,lev,dist)
	title <- paste(lev, "bit", " glcm ", theta_c[i], " d=", dist, sep="")
	persp(tst$glcm[[i]], theta=30, phi=30,main=title, asp=1, 
	xlab="i", ylab="j", zlab="probability")
}



