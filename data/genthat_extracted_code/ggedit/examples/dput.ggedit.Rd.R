library(ggedit)


### Name: dput.ggedit
### Title: Convert ggplot object to a string call
### Aliases: dput.ggedit

### ** Examples


 pList$pointSmooth #original compiled plot
 
 this.gg <- dput.ggedit(pList$pointSmooth) #dput the plot
 
 writeLines(this.gg) #show the output
 
 eval(parse(text=this.gg)) #recompile the plot

 #add theme change
 p <- pList$pointSmooth+theme(panel.background = element_rect(fill='green'))
 
 this.gg<-dput.ggedit(p) #dput the plot
 
 writeLines(this.gg) #show the output
 
 eval(parse(text=this.gg)) #recompile the plot




