library(ips)


### Name: deleteEmptyCells
### Title: Delete Spurious Rows and Columns from DNA Alignments
### Aliases: deleteEmptyCells

### ** Examples

# COX1 sequences of bark beetles
data(ips.cox1)

# introduce completely ambiguous rows and colums
x <- as.character(ips.cox1[1:6, 1:60])
x[3, ] <- rep("n", 60)
x[, 20:24] <- rep("-", 6)
x <- as.DNAbin(x)
image(x)

# delete those rows and colums
x <- deleteEmptyCells(x)
image(x)



