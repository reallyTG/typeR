library(IDmining)


### Name: MBRM_parallel
### Title: Morisita-Based Filter for Redundancy Minimization (Parallel)
### Aliases: MBRM_parallel

### ** Examples

bf <- Butterfly(10000)

bf_select <- MBRM_parallel(bf[,-9], 5:25, ncores=2)
var_order <- bf_select[[2]]
var_perf  <- bf_select[[3]]

dev.new(width=5, height=4)
plot(var_perf,type="b",pch=16,lwd=2,xaxt="n",xlab="", ylab="",
     col="red",ylim=c(0,max(var_perf)),panel.first={grid(lwd=1.5)})
axis(1,1:length(var_order),labels=var_order)
mtext(1,text="Added Features (from left to right)",line=2.5,cex=1)
mtext(2,text="Estimated ID",line=2.5,cex=1)

## Not run: 
##D bf_large <- Butterfly(10^5)
##D system.time(MBRM(bf_large[,-9], 5:25))
##D system.time(MBRM_parallel(bf_large[,-9], 5:25))
## End(Not run)



