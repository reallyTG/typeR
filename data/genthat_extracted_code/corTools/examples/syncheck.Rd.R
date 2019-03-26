library(corTools)


### Name: syncheck
### Title: Identifies Base Pair Change
### Aliases: syncheck

### ** Examples

# Create sample dataset 
chromosome <- c(1, 1, 1, 2, 5)
position <- c(1432, 1542, 6834, 4642, 6435)
bp1 <- c("A", "G", "A", "T", "C")
bp2 <- c("A", "G", "T", "T", "G")
bp3 <- c("A", "C", "A", "G", "C")
bp4 <- c("A", "G", "A", "G", "C")
bp5 <- c("C", "G", "T", "G", "G")
snplist <- cbind(chromosome, position, bp1, bp2, bp3, bp4, bp5)

syncheck(snplist, 1, 6834, chromosome, position)
# snplist is the name of the dataset
# 1 and 6834 represent user query for a SNP hit on that chromosome and at that position
# chromosome and position are the names of the dataset columns that hold the information
# of chromosome and position. 
# function returns the information that on chromosome 1, position 6834, the pattern is
# "A" "T" "A" "A" "T"



