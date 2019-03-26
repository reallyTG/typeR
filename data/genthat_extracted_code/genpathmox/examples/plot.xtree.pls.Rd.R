library(genpathmox)


### Name: plot.xtree.pls
### Title: Plot function for the Pathmox Segmentation Trees: PLS-PM
### Aliases: plot.xtree.pls

### ** Examples

## Not run: 
##D  ## example of PLS-PM in alumni satisfaction
##D 
##D  # select manifest variables
##D  data.fib <-fibtele[,12:35]
##D 
##D  # define inner model matrix
##D  Image     	= rep(0,5)
##D 	Qual.spec	  = rep(0,5)
##D 	Qual.gen		= rep(0,5)
##D 	Value			  = c(1,1,1,0,0)
##D 	Satis			  = c(1,1,1,1,0)
##D  inner.fib = rbind(Image,Qual.spec, Qual.gen, Value, Satis)
##D  colnames(inner.fib) = rownames(inner.fib)
##D 
##D  # blocks of indicators (outer model)
##D  outer.fib  = list(1:8,9:11,12:16,17:20,21:24)
##D  modes.fib  = rep("A", 5)
##D 
##D  # apply plspm
##D  pls.fib = plspm(data.fib, inner.fib, outer.fib, modes.fib)
##D 
##D  # re-ordering those segmentation variables with ordinal scale
##D   seg.fib= fibtele[,2:11]
##D 
##D 	 seg.fib$Age = factor(seg.fib$Age, ordered=T)
##D 	 seg.fib$Salary = factor(seg.fib$Salary,
##D 			levels=c("<18k","25k","35k","45k",">45k"), ordered=T)
##D 	 seg.fib$Accgrade = factor(seg.fib$Accgrade,
##D 			levels=c("accnote<7","7-8accnote","accnote>8"), ordered=T)
##D 	 seg.fib$Grade = factor(seg.fib$Grade,
##D 	    levels=c("<6.5note","6.5-7note","7-7.5note",">7.5note"), ordered=T)
##D 
##D  # Pathmox Analysis
##D  fib.pathmox=pls.pathmox(pls.fib,seg.fib,signif=0.05,
##D 					deep=2,size=0.2,n.node=20)
##D 
##D  # plot pathmox tree
##D  plot(pls.fib)
##D  
## End(Not run)

 library(genpathmox)
 data(fibtele)

 # select manifest variables
 data.fib <-fibtele[1:50,12:35]

 # define inner model matrix
 Image       = rep(0,5)
 Qual.spec		= rep(0,5)
	Qual.gen		= rep(0,5)
	Value			  = c(1,1,1,0,0)
	Satis			  = c(1,1,1,1,0)
 inner.fib = rbind(Image,Qual.spec, Qual.gen, Value, Satis)
 colnames(inner.fib) = rownames(inner.fib)

 # blocks of indicators (outer model)
 outer.fib = list(1:8,9:11,12:16,17:20,21:24)
 modes.fib = rep("A", 5)

 # apply plspm
 pls.fib = plspm(data.fib, inner.fib, outer.fib, modes.fib)


 # re-ordering those segmentation variables with ordinal scale
 seg.fib = fibtele[1:50,c(2,7)]
	seg.fib$Salary = factor(seg.fib$Salary,
			levels=c("<18k","25k","35k","45k",">45k"), ordered=TRUE)

 # Pathmox Analysis
fib.pathmox = pls.pathmox(pls.fib,seg.fib,signif=0.5,
					deep=1,size=0.01,n.node=10)

plot(fib.pathmox)



