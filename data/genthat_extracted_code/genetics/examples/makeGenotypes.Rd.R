library(genetics)


### Name: makeGenotypes
### Title: Convert columns in a dataframe to genotypes or haplotypes
### Aliases: makeGenotypes makeHaplotypes
### Keywords: misc

### ** Examples

## Not run: 
##D # common case
##D data <- read.csv(file="genotype_data.csv")
##D data <- makeGenotypes(data)
## End(Not run)

# Create a test data set where there are several genotypes in columns
# of the form "A/T".
test1 <- data.frame(Tmt=sample(c("Control","Trt1","Trt2"),20, replace=TRUE),
                G1=sample(c("A/T","T/T","T/A",NA),20, replace=TRUE),
                N1=rnorm(20),
                I1=sample(1:100,20,replace=TRUE),
                G2=paste(sample(c("134","138","140","142","146"),20,
                                replace=TRUE),
                         sample(c("134","138","140","142","146"),20,
                                replace=TRUE),
                         sep=" / "),
                G3=sample(c("A /T","T /T","T /A"),20, replace=TRUE),
                comment=sample(c("Possible Bad Data/Lab Error",""),20,
                               rep=TRUE)
                )
test1

# now automatically convert genotype columns
geno1 <- makeGenotypes(test1)
geno1

# Create a test data set where there are several haplotypes with alleles
# in adjacent columns.
test2 <- data.frame(Tmt=sample(c("Control","Trt1","Trt2"),20, replace=TRUE),
                    G1.1=sample(c("A","T",NA),20, replace=TRUE),
                    G1.2=sample(c("A","T",NA),20, replace=TRUE),
                    N1=rnorm(20),
                    I1=sample(1:100,20,replace=TRUE),
                    G2.1=sample(c("134","138","140","142","146"),20,
                                replace=TRUE),
                    G2.2=sample(c("134","138","140","142","146"),20,
                                replace=TRUE),
                    G3.1=sample(c("A ","T ","T "),20, replace=TRUE),
                    G3.2=sample(c("A ","T ","T "),20, replace=TRUE),
                    comment=sample(c("Possible Bad Data/Lab Error",""),20,
                                   rep=TRUE)
                   ) 
test2

# specifly the locations of the columns to be paired for haplotypes
makeHaplotypes(test2, convert=list(c("G1.1","G1.2"),6:7,8:9))

# Create a test data set where the data is coded as numeric allele
# counts (0-2).
test3 <- data.frame(Tmt=sample(c("Control","Trt1","Trt2"),20, replace=TRUE),
                    G1=sample(c(0:2,NA),20, replace=TRUE),
                    N1=rnorm(20),
                    I1=sample(1:100,20,replace=TRUE),
                    G2=sample(0:2,20, replace=TRUE),
                    comment=sample(c("Possible Bad Data/Lab Error",""),20,
                                   rep=TRUE)
                   ) 
test3

# specifly the locations of the columns, and a non-standard conversion
makeGenotypes(test3, convert=c('G1','G2'), method=as.genotype.allele.count)





