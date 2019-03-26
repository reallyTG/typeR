library(shazam)


### Name: makeAverage1merMut
### Title: Make a 1-mer mutability model by averaging over a 5-mer
###   mutability model
### Aliases: makeAverage1merMut

### ** Examples

# Make a degenerate 5-mer model (length of 1024) based on a 1-mer model
example1merMut <- c(A=0.2, T=0.1, C=0.4, G=0.3)
degenerate5merMut <- makeDegenerate5merMut(mut1mer = example1merMut)
 
# Now make a 1-mer model by averaging over the degenerate 5-mer model
# Expected to get back example1merMut
makeAverage1merMut(mut5mer = degenerate5merMut)




