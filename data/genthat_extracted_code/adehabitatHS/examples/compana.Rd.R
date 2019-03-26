library(adehabitatHS)


### Name: compana
### Title: Compositional Analysis of Habitat Use
### Aliases: compana print.compana
### Keywords: math

### ** Examples


## The examples presented here
## are the same as those presented in
## the paper of Aebischer et al. (1993)


#############################
## Pheasant dataset: first
## example in Aebischer et al.

data(pheasant)

## Second order habitat selection
## Selection of home range within the
## study area (example of parametric test)
pheana2 <- compana(pheasant$mcp, pheasant$studyarea,
                   test = "parametric")
pheana2

## The ranking matrix:
print(pheana2$rm, quote = FALSE)

## Third order habitat selection
## (relocation within home range)
## We remove the first pheasant of the analysis
## (as in the paper of Aebischer et al.)
## before the analysis
pheana3 <- compana(pheasant$locs[-1,], pheasant$mcp[-1,c(1,2,4)])
pheana3

## The ranking matrix:
print(pheana3$rm, quote = FALSE)



#############################
## Squirrel data set: second
## example in Aebischer et al.

data(squirrel)

## Second order habitat selection
## Selection of home range within the
## study area
squiana2 <- compana(squirrel$mcp, squirrel$studyarea)
squiana2

## The ranking matrix:
print(squiana2$rm, quote = FALSE)


## However, note that here, the hypothesis of identical use 
## on which this analysis relies is likely to be false.
## Indeed, an eisera indicates:

us <- round(30 * squirrel$locs / 100)
av <- squirrel$studyarea
ii <- eisera(us, av, scannf = FALSE)
scatter(ii, grid = FALSE, clab = 0.7)

## There are clearly two groups of animals.  In such cases,
## compositional analysis is to be avoided in this case.




## Third order habitat selection
## (relocation within home range)
## We remove the second column
## (as in the paper of Aebischer et al.)
squiana3 <- compana(squirrel$locs[,-2], squirrel$mcp[,-2])
squiana3

## The ranking matrix:
print(squiana3$rm, quote = FALSE)





