library(prettyR)


### Name: htmlize
### Title: Read an R script and write HTML output
### Aliases: htmlize
### Keywords: misc

### ** Examples

 rcon<-file("test.R","w")
 cat("#title~This is the title\n")
 cat("test.df<-data.frame(a=factor(sample(LETTERS[1:4],100,TRUE)),\n",
  file=rcon)
 cat(" b=sample(1:4,100,TRUE),c=rnorm(100),d=rnorm(100))\n",file=rcon)
 cat("describe(test.df)\n",file=rcon)
 cat("print(freq(test.df$a))\n",file=rcon)
 cat("xtab(a~b,test.df)\n",file=rcon)
 cat("brkdn(c~b,test.df)\n",file=rcon)
 cat("png(\"hista.png\")\nhist(test.df$b)\ndev.off()\n",file=rcon)
 cat("png(\"plotcd.png\")\nplot(test.df$c,test.df$d)\ndev.off()\n",file=rcon)
 close(rcon)
 # call htmlize with minimal arguments
 htmlize("test.R")
 # if you want to see the output, use the following line
 # system(paste(options("browser")," file:",getwd(),"/test.html",sep="",collapse=""))
 # to clean up, use the following line
 # system("rm test.R test.html hista.png plotcd.png")



