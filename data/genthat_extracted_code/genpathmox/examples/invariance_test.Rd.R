library(genpathmox)


### Name: invariance_test
### Title: Invariance Test
### Aliases: invariance_test

### ** Examples

## Not run: 
##D  ## example of PLS-PM in alumni satisfaction
##D 
##D  data(fibtele)
##D 
##D data.fib <-fibtele[,12:35]
##D 
##D  #define inner model matrix
##D  Image     	= rep(0,5)
##D  Qual.spec	  = rep(0,5)
##D  Qual.gen		= rep(0,5)
##D  Value			  = c(1,1,1,0,0)
##D  Satis			  = c(1,1,1,1,0)
##D  inner.fib = rbind(Image,Qual.spec, Qual.gen, Value, Satis)
##D  colnames(inner.fib) = rownames(inner.fib)
##D 
##D #define blocks of indicators (outer model)
##D outer.fib = list(1:8,9:11,12:16,17:20,21:24)
##D 
##D #efine de mode
##D modes.fib  = rep("A", 5)
##D 
##D #apply plspm
##D pls.fib = plspm(data.fib, inner.fib, outer.fib, modes.fib)
##D 
##D seg.fib = fibtele[,2:11]
##D 
##D seg.fib$Age = factor(seg.fib$Age, ordered=TRUE)
##D seg.fib$Salary = factor(seg.fib$Salary,
##D                        levels=c("<18k","25k","35k","45k",">45k"), ordered=TRUE)
##D seg.fib$Accgrade = factor(seg.fib$Accgrade,
##D                           levels=c("accnote<7","7-8accnote","accnote>8"), ordered=TRUE)
##D seg.fib$Grade = factor(seg.fib$Grade,
##D                        levels=c("<6.5note","6.5-7note","7-7.5note",">7.5note"), ordered=TRUE)
##D 
##D #pathmox Analysis
##D fib.pathmox=pls.pathmox(pls.fib,seg.fib,signif=0.05,deep=2,size=0.2,n.node=20)
##D 
##D #pelect the terminal nodes
##D ls(fib.pathmox)
##D 
##D terminal.nodes=fib.pathmox$terminal[-1]
##D 
##D #Invariance test
##D inv.test=invariance_test(data.fib,terminal.nodes,inner.fib,
##D          outer.fib,modes.fib,scheme="centroid",scaled=FALSE)
##D inv.test
##D  
## End(Not run)

 ## example of PLS-PM in alumni satisfaction

 data(fibtele)

data.fib <-fibtele[,12:35]

#define inner model matrix
Image       = rep(0,5)
Qual.spec	 = rep(0,5)
Qual.gen		 = rep(0,5)
Value			 = c(1,1,1,0,0)
Satis		   = c(1,1,1,1,0)
inner.fib = rbind(Image,Qual.spec, Qual.gen, Value, Satis)
colnames(inner.fib) = rownames(inner.fib)

#define blocks of indicators (outer model)
outer.fib = list(1:8,9:11,12:16,17:20,21:24)

#efine de mode
modes.fib  = rep("A", 5)

#apply plspm
pls.fib = plspm(data.fib, inner.fib, outer.fib, modes.fib)

seg.fib = fibtele[,2:11]

seg.fib$Age = factor(seg.fib$Age, ordered=TRUE)
seg.fib$Salary = factor(seg.fib$Salary,
                       levels=c("<18k","25k","35k","45k",">45k"), ordered=TRUE)
seg.fib$Accgrade = factor(seg.fib$Accgrade,
                          levels=c("accnote<7","7-8accnote","accnote>8"), ordered=TRUE)
seg.fib$Grade = factor(seg.fib$Grade,
                       levels=c("<6.5note","6.5-7note","7-7.5note",">7.5note"), ordered=TRUE)

#pathmox Analysis
fib.pathmox=pls.pathmox(pls.fib,seg.fib,signif=0.05,deep=2,size=0.2,n.node=20)

terminal.nodes=fib.pathmox$terminal[-1]

#Invariance test
inv.test=invariance_test(data.fib,terminal.nodes,inner.fib,
         outer.fib,modes.fib,scheme="centroid",scaled=FALSE)



