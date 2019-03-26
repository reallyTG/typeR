library(corTools)


### Name: candpull
### Title: Finds Candidate Genes
### Aliases: candpull

### ** Examples

# Create two sample datasets 
set1ID <- c(1, 2, 3, 4, 5)
Trait1 <- c(0.005, 0.09, 0.98, 0.767, 0.004)
Trait2 <- c(0.6, 0.89, 0.92, 0.008, 0.4)
Trait3 <- c(0.98, 0.232, 0.53, 0.321, 0.0012)
set1 <- cbind(set1ID, Trait1, Trait2, Trait3)

set2ID <- c(1, 2, 3, 4, 5)
Trait1 <- c(0.43, 0.934, 0.41, 0.43, 0.009)
Trait2 <- c(0.23, 0.423, 0.543, 0.78, 0.99)
Trait3 <- c(0.3423, 0.53, 0.63, 0.765, 0.0053)
set2 <- cbind(set2ID, Trait1, Trait2, Trait3)

candpull(2, "set", 3, "Trait", 0.05)
# 2 denotes the are 2 sets of GWAS datasets
# "set" denotes the dataset name (i.e. set1, set2)
# 3 denotes the number of traits in each dataset- must be the same number
# "Trait" denotes the labels of the columns with trait p-values 
# 0.05 is the significance threshold chosen
# Function returns set ID and trait number if the trait in that set has a
# value lower than the inputted threshold, 0.05  



