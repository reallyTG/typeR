### R code from vignette source 'rainbow.Rnw'
### Encoding: UTF-8

###################################################
### code chunk number 1: rainbow.Rnw:51-53
###################################################
library(rainbow)
options(prompt = "R> ", rainbow.messages = FALSE, digits = 3)


###################################################
### code chunk number 2: rainbow.Rnw:72-77
###################################################
# plot.type = "function", curves are plotted by time
# the most recent curve is shown in purple
# the distant past cure is shown in red
plot(Australiasmoothfertility, plot.type = "functions",
     plotlegend = TRUE)


###################################################
### code chunk number 3: rainbow.Rnw:91-93
###################################################
plot(ElNinosmooth, plot.type = "functions",
     plotlegend = TRUE)


###################################################
### code chunk number 4: rainbow.Rnw:130-131
###################################################
  plot(ElNinosmooth,plot.type="depth",plotlegend=TRUE)


###################################################
### code chunk number 5: rainbow.Rnw:138-139
###################################################
plot(ElNinosmooth,plot.type="density",plotlegend=TRUE)


###################################################
### code chunk number 6: rainbow.Rnw:174-178
###################################################
# plot.type = "bivariate", the bivariate principal component scores are displayed
# type = "bag" requests the bagplot
fboxplot(ElNinosmooth, plot.type = "bivariate", type = "bag", projmethod = "PCAproj", 
         ylim = c(-10, 20), xlim = c(-10, 20))


###################################################
### code chunk number 7: rainbow.Rnw:185-187
###################################################
# plot.type = "functional", the bivariate pc scores are matched to corresponding curves
fboxplot(ElNinosmooth, plot.type = "functional", type = "bag", projmethod = "PCAproj")


###################################################
### code chunk number 8: rainbow.Rnw:220-224
###################################################
# plot.type = "bivariate", the bivariate principal component scores are displayed
# type = "hdr" requests the highest density region boxplot
fboxplot(ElNinosmooth, plot.type="bivariate", type="hdr", alpha=c(0.07,0.5), 
         projmethod = "PCAproj", ylim=c(-10,20), xlim=c(-10,20))


###################################################
### code chunk number 9: rainbow.Rnw:231-233
###################################################
# plot.type = "functional", the bivariate pc scores are matched to corresponding curves
fboxplot(ElNinosmooth, plot.type = "functional", type = "hdr", alpha = c(0.07,0.5), projmethod="PCAproj")


###################################################
### code chunk number 10: rainbow.Rnw:277-278
###################################################
SVDplot(ElNinosmooth, order = 3, plot = TRUE)


