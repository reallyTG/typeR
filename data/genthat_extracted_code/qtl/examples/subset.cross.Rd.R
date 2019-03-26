library(qtl)


### Name: subset.cross
### Title: Subsetting data for QTL experiment
### Aliases: subset.cross [.cross
### Keywords: manip

### ** Examples

data(fake.f2)
fake.f2.A <- subset(fake.f2, chr=c("5","13"))
fake.f2.B <- subset(fake.f2, ind = -c(1,5,10))
fake.f2.C <- subset(fake.f2, chr=1:5, ind=1:50)

data(listeria)
y <- pull.pheno(listeria, 1)
listeriaB <- subset(listeria, ind = (!is.na(y) & y < 264))

# individual identifiers
listeria$pheno$ID <- paste("mouse", 1:nind(listeria), sep="")
listeriaC <- subset(listeria, ind=c("mouse1","mouse11","mouse21"))
listeriaD <- subset(listeria, ind=c("-mouse1","-mouse11","-mouse21"))

# you can also use brackets (like matrix with rows=chromosomes and columns=individuals)
temp <- listeria[c("5","13"),]  # chr 5 and 13
temp <- listeria[ , 1:10]       # first ten individuals
temp <- listeria[5, 1:10]       # chr 5 for first ten individuals



