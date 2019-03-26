library(adegenet)


### Name: snpposi
### Title: Analyse the position of polymorphic sites
### Aliases: snpposi.plot snpposi.plot.integer snpposi.plot.numeric
###   snpposi.plot.DNAbin snpposi.test snpposi.test.integer
###   snpposi.test.numeric snpposi.test.DNAbin

### ** Examples

if(require(ape)){
data(woodmouse)
snpposi.plot(woodmouse, codon=FALSE)
snpposi.plot(woodmouse)

## Not run: 
##D snpposi.test(c(1,3,4,5), 100)
##D snpposi.test(woodmouse)
## End(Not run)
}



