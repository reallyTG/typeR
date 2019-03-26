library(psyphy)


### Name: SS.RGBcalib
### Title: Self-Start Functions for Fitting Luminance vs Grey Level
###   Relation on CRT displays
### Aliases: SS.RGBcalib SS.calib
### Keywords: models nonlinear

### ** Examples


data(RGB)

#Fitting a single gun
W.nls <- nls(Lum ~ SS.calib(Blev, k, gamm, GL), data = RGB,
				subset = (Gun == "W"))
summary(W.nls)

#curvature (parameter effect) is greater when GL is 0:255
Wc.nls <- nls(Lum ~ SS.calib(Blev, k, gamm, GL*255), data = RGB,
				subset = (Gun == "W"))
MASS::rms.curv(W.nls)
MASS::rms.curv(Wc.nls)
pairs(profile(Wc.nls), absVal = FALSE)
pairs(profile(W.nls), absVal = FALSE)


#Fitting 3 guns with independent gamma's		
RGB0.nls <- nlme::nlsList(Lum ~ SS.calib(Blev, k, gamm, GL) | Gun,
		data = subset(RGB, Gun != "W"))
summary(RGB0.nls)
plot(nlme::intervals(RGB0.nls))

# Add covariates to data.frame for R, G and B grey levels
gg <- model.matrix(~-1 + Gun/GL, RGB)[ , c(5:7)]
RGB$Rgun <- gg[, 1]
RGB$Ggun <- gg[, 2]
RGB$Bgun <- gg[, 3]
RGB.nls <- nls(Lum ~ SS.RGBcalib(Blev, Br, Bg, Bb, gamm, Rgun, Ggun, Bgun), 
 			              data = RGB, subset = (Gun != "W") )
summary(RGB.nls)
confint(RGB.nls)




