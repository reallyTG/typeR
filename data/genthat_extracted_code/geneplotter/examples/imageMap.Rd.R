library(geneplotter)


### Name: imageMap-methods
### Title: Write an HTML IMG tag together with a MAP image map.
### Aliases: imageMap imageMap-methods imageMap,matrix-method
###   imageMap,matrix,connection,list,character-method
### Keywords: manip

### ** Examples

f1  = paste(tempfile(), ".html", sep="")
f2  = paste(tempfile(), ".html", sep="")
fpng = tempfile()

if(capabilities()["png"]) {
  ## create the image
  colors = c("#E41A1C","#377EB8","#4DAF4A","#984EA3","#FF7F00","#FFFF33","#A65628","#F781BF","#999999")
  width  = 512
  height = 256
  png(fpng, width=width, height=height)
  par(mai=rep(0,4))
  plot(0,xlim=c(0,width-1),ylim=c(0,height-1),xaxs="i",yaxs="i",type="n",bty="n")
  cx=floor(runif(100)*(width-11))
  cy=floor(runif(100)*(height-11))
  coord=cbind(cx, cy, cx+10, cy+10)
  rect(coord[,1], height-coord[,2], coord[,3], height-coord[,4],
       col=sample(colors, 100, replace=TRUE))
  text(width/2, height-3, "Klick me!", adj=c(0.5, 1), font=2)
  dev.off()

  ## create the frame set
  cat("<html><head><title>Hello world</title></head>\n",
      "<frameset rows=\"280,*\" border=\"0\">\n",
      "<frame name=\"banner\" src=\"file://", f2, "\">\n",
      "<frame name=\"main\" scrolling=\"auto\">",
      "</frameset>", sep="",file=f1)

  ## create the image map
  href  =sample(c("www.bioconductor.org", "www.r-project.org"),nrow(coord),replace=TRUE)
  title =sample(as.character(packageDescription("geneplotter")),nrow(coord),replace=TRUE)
  con = file(f2, open="w")
  imageMap(coord, con,
    list(HREF=paste("http://", href, sep=""),
         TITLE=title, TARGET=rep("main", nrow(coord))), fpng)
  close(con)

  cat("Now have a look at file ", f1, " with your browser.\n", sep="")
}



