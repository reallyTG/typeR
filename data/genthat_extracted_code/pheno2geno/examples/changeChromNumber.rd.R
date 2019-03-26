library(pheno2geno)


### Name: modify number of chromosomes
### Title: Change the number of chromosomes in a cross object
### Aliases: reduceChromosomesNumber removeChromosomes
###   removeTooSmallChromosomes
### Keywords: manip

### ** Examples

    data(testCross)
    plotRF(testCross, main="riself generate.biomarkers example")
    cross_ <- reduceChromosomesNumber(testCross,5,verb=TRUE)
    plotRF(cross_, main="Leaving only 5 chromosomes")
    cross_ <- removeChromosomes(testCross,1,verb=TRUE)
    plotRF(cross_, main="Removing chromosome 1")
    cross_ <- removeTooSmallChromosomes(testCross,5,verb=TRUE)
    plotRF(cross_, main="Leaving only chromosomes with more than 5 markers")



