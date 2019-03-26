library(IDmining)


### Name: MBFR
### Title: Morisita-Based Filter for Regression Problems
### Aliases: MBFR

### ** Examples

## Not run: 
##D bf <- Butterfly(10000)
##D 
##D fly_select <- MBFR(bf, 5:25)
##D var_order  <- fly_select[[2]]
##D var_perf   <- fly_select[[3]]
##D 
##D dev.new(width=5, height=4)
##D plot(var_perf,type="b",pch=16,lwd=2,xaxt="n",xlab="",ylab="",
##D      ylim=c(0,1),col="red",panel.first={grid(lwd=1.5)})
##D axis(1,1:length(var_order),labels=var_order)
##D mtext(1,text = "Added Features (from left to right)",line = 2.5,cex=1)
##D mtext(2,text = "Estimated Dissimilarity",line = 2.5,cex=1)
## End(Not run)



