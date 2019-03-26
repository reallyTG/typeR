library(RandomFields)


### Name: SBS14
### Title: Systematic co-occurrence of tail correlation functions among
###   max-stable processes
### Aliases: SBS14
### Keywords: spatial

### ** Examples
## Don't show: 
StartExample()
## End(Don't show)
## Don't show: ## Not run: 
##D RFoptions(seed=0) ## *ANY* simulation will have the random seed 0; set
##D ##                   RFoptions(seed=NA) to make them all random again
##D 
##D H <- c(0:9, LETTERS[1:6])
##D numbers <- rep(0:255, each=2)
##D col <- c(paste("#0000", H[1 + ((0:255) / 16)], H[1 + ((0:255) %% 16)],sep=""),
##D          paste("#", H[1 + (numbers / 16)], H[1 + (numbers %% 16)],
##D                H[1 + (numbers / 16)], H[1 + (numbers %% 16)], "FF", sep=""))
##D 
##D RFoptions(every=1000, xi=0)
##D x <- seq(0, 5, 0.01)
##D \dontshow{if(RFoptions()$internal$examples_red){warning("modified <x>"); x <- seq(0, 5, 1)}}
##D ## Figure 2
##D model <- RMfbm(alpha=1, var=4) ## not 8 as in the paper, since semi-variogram
##D bm <- RMbrownresnick(model)
##D 
##D 
##D # Fig. 2, Brown-Resnick
##D z1 <- RFsimulate(RPbrownresnick(model), x, x)
##D plot(z1, col=col)
## End(Not run)## End(Don't show)

## Don't show: ## Not run: 
##D dev.copy2pdf(file="SBS_BRorig.pdf");  dev.print(device=jpeg,
##D file="SBS_BRorig.jpg", height=1000, width=1000, quality=100)
## End(Not run)## End(Don't show)



## Don't show: ## Not run: 
##D # Fig. 2, Monotone functions
##D z2 <- RFsimulate(RPsmith(RMm2r(bm), xi=0), x, x, 0)
##D plot(z2, col=col)
## End(Not run)## End(Don't show)

## Don't show: ## Not run: 
##D dev.copy2pdf(file="SBS_mono.pdf"); dev.print(device=jpeg,
##D file="SBS_mono.jpg", height=1000, width=1000, quality=100)
## End(Not run)## End(Don't show)


## Don't show: ## Not run: 
##D # Fig. 2, balls
##D z3 <- RFsimulate(RPsmith(RMm3b(bm)), x, x, 0, eps_zhou=0.1)
##D plot(z3, col=col)
## End(Not run)## End(Don't show)
## Don't show: ## Not run: 
##D   dev.copy2pdf(file="SBS_ball.pdf"); dev.print(device=jpeg,
##D file="SBS_ball.jpg", height=1000, width=1000, quality=100)
## End(Not run)## End(Don't show)

## Don't show: ## Not run: 
##D # Fig. 2,
##D z4 <- RFsimulate(RPsmith(RMmps(bm)), x, x, eps_zhou=0.1)
##D plot(z4, col=col)
## End(Not run)## End(Don't show)
## Don't show: ## Not run: 
##D dev.copy2pdf(file="SBS_poly.pdf"); dev.print(device=jpeg,
##D file="SBS_poly.jpg", height=1000, width=1000, quality=100)
## End(Not run)## End(Don't show)


## Don't show: ## Not run: 
##D ## Figure 4
##D model <- RMexp(var=1.62) 
##D bm <- RMbrownresnick(model)
## End(Not run)## End(Don't show)

## Don't show: ## Not run: 
##D # Fig. 4, Brown-Resnick
##D z5 <- RFsimulate(RPbrownresnick(model), x, x)
##D plot(z5, col=col)
## End(Not run)## End(Don't show)
## Don't show: ## Not run: 
##D dev.copy2pdf(file="SBS_BRexp.pdf"); dev.print(device=jpeg,
##D file="SBS_BRexp.jpg", height=1000, width=1000, quality=100)
## End(Not run)## End(Don't show)


## Don't show: ## Not run: 
##D # Fig. 4, extremal Gaussian
##D z6 <- RFsimulate(RPschlather(bm), x, x)
##D plot(z6, col=col)
## End(Not run)## End(Don't show)
## Don't show: ## Not run: 
##D dev.copy2pdf(file="SBS_schlather.pdf");
##D dev.print(device=jpeg, file="SBS_schlather.jpg",
##D height=1000, width=1000, quality=100)
## End(Not run)## End(Don't show)


## Don't show: ## Not run: 
##D # Fig. 4, extremal binary 
##D z7 <- RFsimulate(RPschlather(RPbernoulli(bm)), x, x)
##D plot(z7, col=col)
## End(Not run)## End(Don't show)
## Don't show: ## Not run: 
##D dev.copy2pdf(file="SBS_binary.pdf");
##D dev.print(device=jpeg, file="SBS_binary.jpg",
##D height=1000, width=1000, quality=100)
## End(Not run)## End(Don't show)



## Don't show: ## Not run: 
##D 
##D # gamma_strokorb = 2 gamma_RandomFields
##D # -> ecf = erfc(sqrt(gamma_RandomFields / 4))
##D 
##D strokorb <- function(t) {
##D   ( 1 + 4 * t ) / ((2 * pi)^1.5 * (2 * t)^2.5) * exp(- 2 * t)
##D }
##D 
##D 
##D density <- function(x, u) {
##D   z <- apply(abs(x - u), 2, max)
##D #  Print(z, u, x)
##D   return(strokorb(min(z)))
##D }
##D 
##D 
##D RFoptions(xi=0)
##D 
##D 
##D model <- RMfbm(var=4, alpha=1) ## not 8 as in the paper as
##D ## SEMI-variograms are used in RandomFields, not variograms
##D ## as in several theoretical papers.
##D 
##D sm <- RMm2r(RMbrownresnick(model))
##D 
##D x <- seq(0, 10, 0.02)
##D  
##D 
##D z <- RFsimulate(RPsmith(RMm2r(RMbrownresnick(model)), xi=0),
##D                 x, x, 0, n=1)
##D H <- c(0:9, LETTERS[1:6])
##D numbers <- rep(0:255, each=2)
##D col <- c(paste("#0000", H[1 + ((0:255) / 16)], H[1 + ((0:255) ##D 
##D          paste("#", H[1 + (numbers / 16)], H[1 + (numbers ##D 
##D                H[1 + (numbers / 16)], H[1 + (numbers ##D 
##D          )
##D plot(z, type="p", pch=20, cex=0.4, col=col)
##D 
##D # dev.copy2pdf(file="strokorb.pdf") 
##D 
##D readline()
##D y <- as.double(as.matrix(z@data))
##D Print(range(y))
##D hist(y, 200, freq=FALSE)
##D a <- seq(-4, 10, 0.1)
##D lines(a, exp(-a) * exp(-exp(-a)))
##D 
##D ############# test
##D 
##D system.time(
##D z <- RFsimulate(RPsmith(RMm2r(RMbrownresnick(model)), xi=0),
##D                 seq(0, len=400, by=0.02), seq(0, len=400, by=0.02), 0, n=1,
##D                 spConform=FALSE, every=0)
##D )
##D 
##D ###
##D 
##D ### Hintergrundbild
##D z <- RFsimulate(RPsmith(RMm2r(RMbrownresnick(model)), xi=0),
##D                 seq(0, 1920/100, 0.02), seq(0, 1280/100, 0.02), 0, n=1,
##D                 spConform=FALSE, every=0)
##D                
##D H <- c(0:9, LETTERS[1:6])
##D numbers <- rep(0:240, each=1)
##D col <- c(paste("#0000", H[1 + ((0:255) / 16)], H[1 + ((0:255) ##D 
##D          paste("#", H[1 + (numbers / 16)], H[1 + (numbers ##D 
##D                H[1 + (numbers / 16)], H[1 + (numbers ##D 
##D          )
##D png(filename="~/Pictures/strokorb.png", width=1920, height=1280)#1930,1290
##D par(mar=rep(0,4))
##D image(z[,,1], col=col)
##D 
##D 
## End(Not run)## End(Don't show)

## Don't show: 
FinalizeExample()
## End(Don't show)


