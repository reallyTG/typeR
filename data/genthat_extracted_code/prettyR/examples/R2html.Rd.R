library(prettyR)


### Name: R2html
### Title: Read an R script and write HTML output
### Aliases: R2html
### Keywords: misc

### ** Examples

 rcon<-file("testR2html.R","w")
 cat("test.df<-data.frame(a=factor(sample(LETTERS[1:4],100,TRUE)),\n",
  file=rcon)
 cat(" b=sample(1:4,100,TRUE),c=rnorm(100),d=rnorm(100))\n",file=rcon)
 cat("describe(test.df)\n",file=rcon)
 cat("print(freq(test.df$a))\n",file=rcon)
 cat("xtab(a~b,test.df)\n",file=rcon)
 cat("brkdn(c~b,test.df)\n",file=rcon)
 cat("hist(test.df$b)#--FIG:hista.png--\n",file=rcon)
 cat("plot(test.df$c,test.df$d)#--FIG:plotcd.png--\n",file=rcon)
 close(rcon)
 # R2html("testR2html.R", "testR2html.html")
 # if you want to see the output, use the following line
 # system(paste(options("browser")," file:",getwd(),"/testR2html.html",sep="",collapse=""))
 # to clean up, use the following line
 # system("rm testR2html.R testR2html.html testR2html_nav.html")
 # system("rm testR2html_list.html hista.png plotcd.png")



