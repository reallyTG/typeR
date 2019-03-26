library(cdparcoord)


### Name: quickstart
### Title: cdparcoord: Quick start
### Aliases: quickstart

### ** Examples

   # programmer/engineer info from 2000 Census
   data(prgeng)
   # select some columns of interest
   pe <- prgeng[,c(1,3,5,7:9)]
   # remove some extreme values
   pe25 <- pe[pe$wageinc < 250000,]
   # some numeric variables are really factors
   pe25 <- makeFactor(pe25,c('educ','occ','sex'))
   # convert the continuous variables to discrete
   pe25disc <- discretize(pe25,nlevels=5)
   ## Not run: 
##D       # display
##D       discparcoord(pe25disc,k=150)
##D       # then possibly brush, etc. 
##D    
## End(Not run)



