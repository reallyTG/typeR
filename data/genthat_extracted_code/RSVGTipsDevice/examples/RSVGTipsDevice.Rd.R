library(RSVGTipsDevice)


### Name: RSVGTipsDevice
### Title: A SVG Graphics Driver with dynamic tips
### Aliases: RSVGTipsDevice
### Keywords: device package

### ** Examples

library("RSVGTipsDevice")
sessionInfo()
devSVGTips("svgplot1.svg", toolTipMode=1,
    title="SVG example plot 1: Shapes and Points, Tooltips are Title + 1 Line")
plot(c(0,10),c(0,10), type="n", xlab="x", ylab="y",
    main="Example SVG plot with title + 1 line tips (mode=1)")
setSVGShapeToolTip(title="A rectangle", desc="that is yellow")
rect(1,1,4,6, col='yellow')
setSVGShapeToolTip(title="1st circle with title only")
points(5.5,7.5,cex=20,pch=19,col='red')
setSVGShapeToolTip(title="A triangle", desc="big and green")
polygon(c(3,6,8), c(3,6,3), col='green')
# no tooltips on these points
points(2:8, 8:2, cex=3, pch=19, col='black')
# tooltips on each these points
invisible(sapply(1:7, function(x)
{setSVGShapeToolTip(title=paste("point", x))
 points(x+1, 8-x, cex=3, pch=1, col='black')}))
setSVGShapeToolTip(title="Text", desc="can have a tool tip too!")
text(x=4, y=9, lab="Poke me!", col="blue")
dev.off()

devSVGTips("svgplot2.svg", toolTipMode=2,
    title="SVG example plot 2: shapes and points, tooltips are title + 2 lines")
getSVGToolTipMode()
setSVGShapeToolTip(title="First circle title only")
plot(1:3, cex=10, main="Example SVG plot with title + 2 line tips (mode=2)")
setSVGShapeToolTip(title="A rectangle", desc="with a 1 line tip")
rect(1,1,2,2)
setSVGShapeToolTip(title="second circle", desc1="first line of description",
                   desc2="second line of description")
points(1.5,2.5,cex=20,pch=19,col='red')
dev.off()

devSVGTips("svgplot3.svg", toolTipMode=2,
    title="SVG example plot 3: shapes, tooltips are title + 2 lines")
plot(c(0,10),c(0,10), type="n", xlab="x", ylab="y",
    main="Example SVG plot, tooltips are title + 2 lines (mode=2)")
setSVGShapeToolTip(title="A rectangle", desc="that is yellow")
rect(1,1,4,6, col='yellow')
setSVGShapeToolTip(title="1st circle", desc1="1st line of description",
    desc2="2nd line of description")
points(5.5,7.5,cex=20,pch=19,col='red')
setSVGShapeToolTip(title="A triangle", desc1="green", desc2="big")
polygon(c(3,6,8), c(3,6,3), col='green')
# no tooltips on these points
points(2:8, 8:2, cex=3, pch=19, col='black')
# tooltips on each of these points
invisible(sapply(1:7, function(x)
{setSVGShapeToolTip(title=paste("point", x))
 points(x+1, 8-x, cex=3, pch=1, col='black')}))
dev.off()

devSVGTips("svgplot4.svg", title="SVG example plot 4: points and no tooltips")
plot(1:11,(-5:5)^2, type='b', main="Simple Example Plot with no tooltips")
dev.off()

devSVGTips("svgplot5.svg",
    title="SVG example plot 5: points and a rectangle, no tooltips")
plot(1:3)
rect(1,1,2,2)
dev.off()

devSVGTips("svgplot6.svg",
    title="SVG example plot 6: supply XML code for tips (title + 1 line)")
setSVGShapeContents("<title>first circle</title>")
plot(1:3, cex=10)
setSVGShapeContents("<title>hah!</title>")
rect(1,1,2,2)
setSVGShapeContents("<title>second circle</title><desc>description</desc>")
points(1.5,2.5,cex=20,pch=19,col='red')
dev.off()

devSVGTips("svgplot7.svg", toolTipMode=2,
    title="SVG example plot 7: supply XML code for tips (title + 2 lines)")
setSVGShapeContents("<title>first circle</title>")
plot(1:3, cex=10)
setSVGShapeContents("<title>hah!</title>")
rect(1,1,2,2)
setSVGShapeContents(paste("<title>second circle</title><desc1>first line of description</desc1>",
                          "<desc2>second line of description</desc2>", collapse=''))
points(1.5,2.5,cex=20,pch=19,col='red')
dev.off()

devSVGTips("svgplot8.svg", toolTipMode=1,
    title="SVG example plot 8: tooltips + hyperlink")
plot(c(0,10),c(0,10), type="n", xlab="x", ylab="y",
    main="Example SVG plot with title + 1 line tips (mode=1) + hyperlink")
setSVGShapeToolTip(title="A rectangle", desc="that is yellow")
rect(1,1,4,6, col='yellow')
setSVGShapeToolTip(title="1st circle with title only")
points(5.5,7.5,cex=20,pch=19,col='red')
setSVGShapeToolTip(title="A triangle", desc="big and green")
polygon(c(3,6,8), c(3,6,3), col='green')
# no tooltips on these points
points(2:8, 8:2, cex=3, pch=19, col='black')
# tooltips on each these points
invisible(sapply(1:7, function(x)
{setSVGShapeToolTip(title=paste("point", x))
 points(x+1, 8-x, cex=3, pch=1, col='black')}))
# Hyperlink to www.r-project.org
setSVGShapeToolTip(title="www.r-project.org", desc="click to visit!")
setSVGShapeURL("http://www.r-project.org")
rect(8,6,10,7, col='blue')
# Hyperlink to www.r-project.org that opens in a new browser window or tab
setSVGShapeToolTip(title="www.r-project.org", desc="click to visit in a new page!")
setSVGShapeURL("http://www.r-project.org", "_blank")
rect(8,8,10,9, col='green')
dev.off()

devSVGTips("svgplot9.svg", toolTipMode=1,
    title="SVG example plot 9: line and point types")
plot(c(0,20),c(0,5), type="n", xlab="x", ylab="y",
    main="Example SVG plot with different line and point types")
for (i in 0:16) {
    lines(i+(0:4), (1:5), col=max(i,1), pch=i, lty=i, type="b")
    text(i, 0.5, lab=as.character(i), cex=2^(abs((i-8)/4)-1))
}
dev.off()

# This example checks encoding of characters that are special in XML: # <&'\">
# To avoid tripping up people who have already used the XML entity
# (e.g., "&amp"), an ampersand followed by lower-case letters and a
# semicolon is NOT encoded.
devSVGTips("svgplot10.svg", toolTipMode=1,
    title="SVG example plot 10: shapes and points, tooltips are title + 1 line, special chars")
plot(c(0,10),c(0,10), type="n", xlab="x", ylab="y",
    main="Example SVG plot with title + 1 line tips <mode=1>")
setSVGShapeToolTip(title="A rectangle", desc="that is <yellow> &amp; yellow")
rect(1,1,4,6, col='yellow')
setSVGShapeToolTip(title="1st circle with title only")
points(5.5,7.5,cex=20,pch=19,col='red')
setSVGShapeToolTip(title="A triangle", desc="big & green")
polygon(c(3,6,8), c(3,6,3), col='green')
text(lab="Special chars: <&'\">", 6, 9, adj=0, cex=1.3)
text(lab="Already encoded: &lt;&amp;&gt;", 6, 9.5, adj=0, cex=1.3)
# no tooltips on these points
points(2:8, 8:2, cex=3, pch=19, col='black')
# tooltips on each these points
invisible(sapply(1:7, function(x)
{setSVGShapeToolTip(title=paste("<point ", x, ">", sep=""))
 points(x+1, 8-x, cex=3, pch=1, col='black')}))
dev.off()

# This example checks that the fontwidth information is accurate
# by drawing a box closely around letters.
# Compare appearance to other devices if you want to make things
# more accurate.  Note that some descenders and ascenders will go
# outside of the bounds.  This info is in src/devSVG.c:charwidth.
devSVGTips("svgplot11.svg", toolTipMode=0, title="SVG example plot 11: text width with cex=1")
charbysize0 <- paste("'ijlIJ,./\\|:;f!\"()[]rt-*?FLTYcksxyzv`_0123456789EKPRX",
                     "abdeghnopqu{}\177$ wABCSVDGHNOQUZ#&+<=>MW^~%@m", collapse='')
allchars    <- paste(" !\"#$%&'()*+,-./0123456789:;<=>?@ABCDEFGHIJKLMNOPQRSTUVWXYZ",
                     "[\\]^_`abcdefghijklmnopqrstuvwxyz{|}~\177", collapse='')
charbysize <- paste(c(charbysize0,
    setdiff(strsplit(allchars, NULL)[[1]], strsplit(charbysize0, NULL)[[1]])), collapse="")
textinbox <- function(x, y, i) {
  cc <- substring(charbysize, i-31, i-31)
  # cc <- rawToChar(as.raw(i))
  lab <- paste(rep(cc,10), collapse="")
  w <- strwidth(lab)
  if (cc==" ")
      lab <- paste(lab, "<", sep="")
  text(x, y, lab=lab, adj=c(0))
  rect(x, y-strheight(lab)/2, x+w, y+strheight(lab)/2)
}
par(mar=c(0,0,0,0))
plot(y=c(0,25),x=c(0,4), type="n", axes=FALSE, xlab="", ylab="")
text(2,25,"Character metric info: box is drawn around strings using strwidth & strheight")
for (i in 32:127) textinbox(x=0.1+(i-32)%/%24, y=24-(i-32)%%24, i)
# print(data.frame(letters, strwidth(letters)))
dev.off()

# This example checks that the character alignment information is
# accurate.
devSVGTips("svgplot12.svg", toolTipMode=0, title="SVG example plot 12: character alignment",
           height=6, width=6)
par(mar=c(0,0,0,0))
plot(y=c(-5,5),x=c(-10,10), type="n", axes=FALSE, xlab="", ylab="")
text(0,4.5,"Character alignment using adj= or pos= in text()")
text(0,4,"Text is drawn at red '+' using args shown")
text(0,3.5,lab="XXX")
points(0,3.5,pch=3,col='red')
for (xadj in (0:2)/2) {
  text(-3+6*(1-xadj),3,paste("X adj=", xadj," X",sep=""),adj=xadj)
  points(-3+6*(1-xadj),3,pch=3,col='red')
}
for (pos in 1:4) {
    text(c(0,-1,0,1)[pos], 1.5+0.5*c(-1,0,1,0)[pos], paste("X pos=", pos, " X", sep=""), pos=pos)
    points(c(0,-1,0,1)[pos], 1.5+0.5*c(-1,0,1,0)[pos], pch=3, col='red')
}
for (xadj in (0:2)/2)
  for (yadj in (0:2)/2) {
    text(6*(0.5-xadj),-1.5+(1-yadj),paste("X adj=", xadj,",",yadj," X",sep=""),adj=c(xadj,yadj))
    points(6*(0.5-xadj),-1.5+(1-yadj),pch=3,col='red')
  }
dev.off()

# This example shows what happens with text clipping.
# Too much clipping occurs!  I think is is not calling
# the text method for the device whenever the text might
# be a little out-of-bounds (because of the setting
# dd->canClip=FALSE in src/devSVG.c).  It seems to be too
# aggressive about this, e.g., when par(xpd=NA) (xpd=NA
# means clip to device region, xpd=TRUE means clip to
# figure region, and xpd=FALSE means clip to plot region).
devSVGTips("svgplot13.svg", toolTipMode=0, title="SVG example plot 13: character clipping",
           height=6, width=6)
par(xpd=FALSE)
par(mfrow=c(2,2))
par(mar=c(5, 4, 4, 2) + 0.1)
str <- paste(letters[c(1:6,21:26)],collapse="")
plot(y=c(-10,10),x=c(-10,10), type="n", xlab="X axis", ylab="Y axis",
     main=paste("par(xpd=", par("xpd"), ")", sep=""))
text(0,2,paste("clip to",
     switch(as.character(par("xpd")),"NA"="device","TRUE"="figure","FALSE"="plot"),
     "region"))
text(-9,9,str,srt=45)
text(9,0,str,srt=0)
text(9,9,str,srt=-45)
text(0,-9,str,srt=-90)
text(9,-9,str,srt=-135)
text(-9,0,str,srt=180)
text(-9,-9,str,srt=135)
text(0,9,str,srt=90)
par(xpd=TRUE)
plot(y=c(-10,10),x=c(-10,10), type="n", xlab="X axis", ylab="Y axis",
     main=paste("par(xpd=", par("xpd"), ")", sep=""))
text(0,2,paste("clip to",
     switch(as.character(par("xpd")),"NA"="device","TRUE"="figure","FALSE"="plot"),
     "region"))
text(-9,9,str,srt=45)
text(9,0,str,srt=0)
text(9,9,str,srt=-45)
text(0,-9,str,srt=-90)
text(9,-9,str,srt=-135)
text(-9,0,str,srt=180)
text(-9,-9,str,srt=135)
text(0,9,str,srt=90)
par(xpd=NA)
plot(y=c(-10,10),x=c(-10,10), type="n", xlab="X axis", ylab="Y axis",
     main=paste("par(xpd=", par("xpd"), ")", sep=""))
text(0,2,paste("clip to",
     switch(as.character(par("xpd")),"NA"="device","TRUE"="figure","FALSE"="plot"),
     "region"))
text(-9,9,str,srt=45)
text(9,0,str,srt=0)
text(9,9,str,srt=-45)
text(0,-9,str,srt=-90)
text(9,-9,str,srt=-135)
text(-9,0,str,srt=180)
text(-9,-9,str,srt=135)
text(0,9,str,srt=90)
par(xpd=FALSE)
dev.off()




