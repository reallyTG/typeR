library(openCR)


### Name: PPNpossums
### Title: Orongorongo Valley Brushtail Possums
### Aliases: FebpossumCH
### Keywords: datasets

### ** Examples


summary(FebpossumCH) 
m.array(FebpossumCH)
JS.counts(FebpossumCH)

FebD1CH <- subset(FebpossumCH, occasion = 1)

## Not run: 
##D 
##D # reading the text file 'poss8088.data'
##D 
##D datadir <- system.file('extdata', package = 'openCR')
##D poss8088df <- read.table (paste0(datadir,'/poss8088.data'), header = TRUE)
##D capt <- poss8088df[,c('session','id','day','day','sex')]
##D 
##D # duplication of day is a trick to get a dummy trapID column in the right place
##D # this is needed because make.capthist does not have nonspatial option
##D capt$day.1[] <- 1  
##D 
##D # keep only February samples
##D capt <- capt[capt$session %% 3 == 1,]
##D 
##D # build nonspatial secr capthist object using dummy trapping grid
##D FebpossumCH <- make.capthist(capt, make.grid(1,2,ID='numx'))
##D # discard dummy traps objects
##D for (i in 1:9) attr(FebpossumCH[[i]], 'traps') <- NULL
##D names(FebpossumCH) <- 1980:1988 
##D sessionlabels(FebpossumCH) <- 1980:1988
##D 
## End(Not run)




