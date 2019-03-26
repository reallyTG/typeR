library(recosystem)


### Name: output
### Title: Exporting Factorization Matrices
### Aliases: output

### ** Examples

train_set = system.file("dat", "smalltrain.txt", package = "recosystem")
r = Reco()
set.seed(123) # This is a randomized algorithm
r$train(data_file(train_set), opts = list(dim = 10, nmf = TRUE))

## Write P and Q matrices to files
P_file = out_file(tempfile())
Q_file = out_file(tempfile())
r$output(P_file, Q_file)
head(read.table(P_file@dest, header = FALSE, sep = " "))
head(read.table(Q_file@dest, header = FALSE, sep = " "))

## Skip P and only export Q
r$output(out_nothing(), Q_file)

## Return P and Q in memory
res = r$output(out_memory(), out_memory())
head(res$P)
head(res$Q)




