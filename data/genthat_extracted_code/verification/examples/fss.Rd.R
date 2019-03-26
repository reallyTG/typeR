library(verification)


### Name: fss
### Title: Fractional Skill Score
### Aliases: fss
### Keywords: file

### ** Examples

grid<- list( x= seq( 0,5,,100), y= seq(0,5,,100)) 
obj<-Exp.image.cov( grid=grid, theta=.5, setup=TRUE)
look<- sim.rf( obj)
look[look < 0] <- 0

look2 <- sim.rf( obj)
look2[look2<0] <- 0

fss(look, look2, w=5)


## Not run: 
##D #  The following example replicates Figure 4 in Roberts and Lean (2008).
##D ####      examples
##D 
##D LAG <- c(1,3,11,21)
##D box.radius <- seq(0,24,2)
##D 
##D OUT <- matrix(NA, nrow = length(box.radius), ncol = length(LAG) )
##D 
##D for(w in 1:4){
##D 
##D FRCS <- OBS <- matrix(0, nrow = 100, ncol = 100)
##D 
##D obs.id        <- 50
##D OBS[,obs.id]  <- 1
##D 
##D FRCS[, obs.id + LAG[w]] <- 1
##D 
##D for(i in 1:length(box.radius)){
##D 
##D OUT[i, w] <- fss(obs = OBS, pred = FRCS, w = box.radius[i] )
##D 
##D } ### close i
##D } ### close w
##D 
##D b <- mean(OBS) ## base rate
##D 
##D fss.uniform  <- 0.5 + b/2
##D fss.random   <- b
##D 
##D matplot(OUT, ylim = c(0,1), ylab = "FSS", xlab = "grid squares", 
##D type = "b", lty = 1, axes = FALSE , lwd = 2)
##D 
##D abline(h = c(fss.uniform, fss.random), lty = 2)  
##D axis(2)
##D box()
##D axis(1, at = 1:length(box.radius), lab = 2*box.radius + 1)
##D grid()
##D 
##D legend("bottomright", legend = LAG, col = 1:4, pch = as.character(1:4), 
##D  title = "Spatial Lag", inset = 0.02, lwd = 2 )
## End(Not run)




