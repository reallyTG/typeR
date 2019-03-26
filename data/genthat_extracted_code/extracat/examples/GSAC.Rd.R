library(extracat)


### Name: gsac
### Title: GSAC
### Aliases: gsac

### ** Examples

## Not run: 
##D 	
##D ss <- sample(1:nrow(plants),500)
##D M <- t( as.matrix(plants[ss,-1]) )
##D 
##D gs <- gsac(M, fun="IBCC", foreign=".Call")
##D 
##D heattile(M, Is = getIs2(gs, dim(M)), fluct = TRUE, hm.palette = 1)	
## End(Not run)
	
# simulated example:

A <- arsim(3000,c(8,5),1)
B <- arsim(2000,c(7,6),1)
C <- arsim(4000,c(9,9),1)
M <- matrix(0,16,16)

M[1:8,1:5] <- A
M[4:10,6:11] <- B
M[8:16,8:16] <- C

M <- as.table(optile(M, iter=20))
t0 <- 0.6

# no subtable reordering
test1 <- gsac(M,resort="none",method= "BCI", tau0=t0)

require(scales)
heattile(M,Is=test1,hm.palette=alpha(1,0.8),shape="r",
fluct = TRUE, label = c(TRUE,TRUE),bg.col=NA, lab.opt = list(rot=c(0,90)))


## Not run: 
##D # unrestricted subtable reordering
##D test2 <- gsac(M,resort="s", method= "BCI", tau0=t0)
##D 
##D #common reordering
##D test3 <- gsac(M,resort="c", method= "BCI", tau0=t0)
##D 
##D # clusters do not share rows, columns, both
##D test4 <- gsac(M,resort="s",force.cs=TRUE,method = "BCI", tau0=t0)
##D test5 <- gsac(M,resort="s",force.rs=TRUE,method = "BCI", tau0=t0)
##D test6 <- gsac(M,resort="s",force.rs=TRUE,force.cs=TRUE, tau0=t0)
## End(Not run)


## Not run: 
##D heattile(M,Is=test2,hm.palette=alpha(1,0.8),shape="r",
##D fluct = TRUE, label = c(TRUE,TRUE),bg.col=NA, lab.opt = list(rot=c(0,90)))
##D 
##D heattile(M,Is=test3,hm.palette=alpha(1,0.8),shape="r",
##D fluct = TRUE, label = c(TRUE,TRUE),bg.col=NA, lab.opt = list(rot=c(0,90)))
##D 
##D heattile(M,Is=test4,hm.palette=alpha(1,0.8),shape="r",
##D fluct = TRUE, label = c(TRUE,TRUE),bg.col=NA, lab.opt = list(rot=c(0,90)))
##D 
##D heattile(M,Is=test5,hm.palette=alpha(1,0.8),shape="r",
##D fluct = TRUE, label = c(TRUE,TRUE),bg.col=NA, lab.opt = list(rot=c(0,90)))
##D 
##D heattile(M,Is=test6,hm.palette=alpha(1,0.8),shape="r",
##D fluct = TRUE, label = c(TRUE,TRUE),bg.col=NA, lab.opt = list(rot=c(0,90)))
## End(Not run)





