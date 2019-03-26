library(dismo)


### Name: ecolim
### Title: Ecolim model
### Aliases: ecolim ecolim,matrix,matrix-method EcoLim-class
###   predict,EcoLim-method
### Keywords: spatial

### ** Examples

# get predictor variables
fnames <- list.files(path=paste(system.file(package="dismo"), '/ex', sep=''), 
              pattern='grd', full.names=TRUE ) 
env <- stack(fnames)

bio1 <- c(200,250,400,450)
bio12 <- c(0,1000, 3000, 4000)
r1 <- c(0, 1, 1, 0)
r2 <- c(0, 0, 1, 1)
x <- cbind(bio1, bio12)
y <- cbind(r1, r2)

e <- ecolim(x, y) 
plot(e, lwd=2, col='red')
p <- predict(e, env)
plot(p)

# no extrapolation:
ef <- ecolim(x, y, extrapolate=FALSE) 
pf <- predict(ef, env)
plot(pf)


occurence <- paste(system.file(package="dismo"), '/ex/bradypus.csv', sep='')
occ <- read.table(occurence, header=TRUE, sep=',')[,-1]
fold <- kfold(occ, k=5)
occtest <- occ[fold == 1, ]
occtrain <- occ[fold != 1, ]
bg <- randomPoints(env, 1000)


## Not run: 
##D # An approach to optimize the values based on
##D # some known presences and (here random) absences
##D # for the same species as in the maxent example
##D 
##D # intial parameters
##D v <- c(200, 250, 400, 450, 0, 1000, 3000, 4000)
##D 
##D # function to be minimized
##D f <- function(p) {
##D 	x[] <- p
##D 	# numbers must go up
##D 	if ( any(x[-1,] < x[-nrow(x), ]) ) return(Inf)
##D 	e <- ecolim(x, y) 
##D 	# we are minimizing, hence 1-AUC
##D 	1-evaluate(e, p=occtrain, a=bg, x=env)@auc
##D }
##D 
##D # patience...
##D set.seed(0)
##D z <- optim(v, f)
##D 
##D x[] <- z$par
##D eco <- ecolim(x, y) 
##D evaluate(eco, p=occtest, a=bg, x=env)
##D 
##D set.seed(0)
##D pwd <- pwdSample(occtest,bg,occtrain)
##D ptest <- occtest[!is.na(pwd),]
##D atest <- bg[na.omit(pwd),]
##D evaluate(eco, p=ptest, a=atest, x=env)
##D 
##D p2 <- predict(eco, env)
##D plot(p2)
## End(Not run)



