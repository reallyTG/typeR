library(RZooRoH)


### Name: zoodata
### Title: Read the genotype data file
### Aliases: zoodata

### ** Examples


# Get the name and location of example files

myfile1 <- system.file("exdata","genoex.txt",package="RZooRoH")
myfile2 <- system.file("exdata","genosim.txt",package="RZooRoH")

# Load your data with default format into a zooin object named "data1":

data1 <- zoodata(myfile1)

# Load the first data file with default format and filtering out markers with MAF < 0.02
# into a zooin object called "data1frq002":

data1frq002 <- zoodata(myfile1, min_maf = 0.02)

# Load the first data file with default format, with external allele frequencies
# (here a random set we create) and filtering out markers with MAF < 0.01:

myrandomfreq <- runif(14831)
data1c <- zoodata(myfile1, allelefreq = myrandomfreq, min_maf = 0.01)

# Load the second data file and indicate your own format (chromosome number in column 1,
# map position in column 2, 4 columns before genotypes) and filtering out markers with
# MAF < 0.01. The created zooin object is called "Sim5":

Sim5 <- zoodata(myfile2, chrcol = 1, poscol =2, supcol = 4, min_maf = 0.01)




