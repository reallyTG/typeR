library(algstat)


### Name: metropolis
### Title: Markov Basis Metropolis-Hastings Algorithm
### Aliases: metropolis

### ** Examples

## Not run: 
##D 
##D 
##D 
##D data(handy)
##D 
##D exp   <- loglin(handy, as.list(1:2), fit = TRUE)$fit
##D e <- unname(tab2vec(exp))
##D h <- t(t(unname(tab2vec(handy))))
##D chisq <- algstat:::computeChisqsCpp(h, e)
##D 
##D out <- hierarchical(~ Gender + Handedness, data = handy)
##D chisqs <- algstat:::computeChisqsCpp(out$steps, e)
##D 
##D mean(chisqs >= chisq)
##D fisher.test(handy)$p.value
##D 
##D 
##D 
##D 
##D 
##D A <- hmat(c(2,2), as.list(1:2))
##D moves <- markov(A)
##D outC <- metropolis(tab2vec(handy), moves, 1e4, engine = "Cpp")
##D str(outC)
##D outR <- metropolis(tab2vec(handy), moves, 1e4, engine = "R", thin = 20)
##D str(outR)
##D 
##D # showSteps(out$steps)
##D 
##D 
##D library(microbenchmark)
##D microbenchmark(
##D   metropolis(tab2vec(handy), moves, engine = "Cpp"),
##D   metropolis(tab2vec(handy), moves, engine = "R")
##D )
##D 
##D # cpp ~ 20-25x faster
##D 
##D 
##D 
##D 
##D 
##D 
##D 
##D 
##D 
##D 
##D 
##D 
##D 
##D showSteps <- function(steps){
##D   apply(steps, 2, function(x){
##D     x <- format(x)
##D     tab <- vec2tab(x, dim(handy))
##D     message(
##D       paste(
##D         apply(tab, 1, paste, collapse = " "),
##D         collapse = " "
##D       )
##D     )
##D     message("
##D ", appendLF = F)
##D   })
##D   invisible()
##D }
##D # showSteps(out$steps)
##D 
##D 
##D 
##D 
##D 
##D 
##D 
##D 
## End(Not run)



