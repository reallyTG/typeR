library(qtl)


### Name: plotPXG
### Title: Plot phenotypes versus marker genotypes
### Aliases: plotPXG
### Keywords: hplot

### ** Examples

data(listeria)
mname <- find.marker(listeria, 5, 28) # marker D5M357
plotPXG(listeria, mname)

mname2 <- find.marker(listeria, 13, 26) # marker D13Mit147
plotPXG(listeria, c(mname, mname2))
plotPXG(listeria, c(mname2, mname))

# output of the function contains the raw data
output <- plotPXG(listeria, mname)
head(output)

# another example
data(fake.f2)
mname <- find.marker(fake.f2, 1, 37) # marker D1M437
plotPXG(fake.f2, mname)

mname2 <- find.marker(fake.f2, "X", 14) # marker DXM66
plotPXG(fake.f2, mname2)

plotPXG(fake.f2, c(mname,mname2))
plotPXG(fake.f2, c(mname2,mname))




