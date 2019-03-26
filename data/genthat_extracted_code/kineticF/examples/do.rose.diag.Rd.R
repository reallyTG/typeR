library(kineticF)


### Name: do.rose.diag
### Title: Rose diagrams of sector frequencies
### Aliases: do.rose.diag

### ** Examples


## kf.sort must be run before do.rose.diag

test<- kf.sort()
					
try3<- do.rose.diag(test$mat.output$Sector, test$mat.output$fIII4e, 
                    shrink=0.9, prop=2.5, col='salmon', rotation=0)
 
mtext(text='III4e points plotted', side=3, line=-18, cex=1.2)



