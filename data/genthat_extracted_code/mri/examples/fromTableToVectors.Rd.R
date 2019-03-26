library(mri)


### Name: fromTableToVectors
### Title: From Contingency Table to Data Frame
### Aliases: fromTableToVectors

### ** Examples

data <- rbind(c(0, 10, 0, 0, 0),
                    c(0, 10, 0, 0, 0),
                    c(0, 0, 10, 0, 0),
                    c(0, 0,  0, 5, 5))
rownames(data) <- 1:4
colnames(data) <- 1:5
fromTableToVectors(cont.table = data)



