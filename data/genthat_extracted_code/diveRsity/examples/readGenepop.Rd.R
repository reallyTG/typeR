library(diveRsity)


### Name: readGenepop
### Title: A function to calculate allele frequencies from genepop files.
### Aliases: readGenepop

### ** Examples

# Code to plot ordered allele fragment sizes to assess mutation model.
data(Test_data, package = "diveRsity") # define data
x <- readGenepop(infile = Test_data, gp = 3, bootstrap = FALSE)
locus10_pop1 <- c(x$pop_alleles[[1]][[2]][,10],
                  x$pop_alleles[[1]][[2]][,10])
sort_order <- order(locus10_pop1, decreasing = FALSE) #sort alleles
plot(locus10_pop1[sort_order], col="red", ylab = "Allele size")



