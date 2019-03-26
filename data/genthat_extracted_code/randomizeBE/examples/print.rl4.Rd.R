library(randomizeBE)


### Name: print.rl4
### Title: S3 method 'print' for class "rl4"
### Aliases: print.rl4

### ** Examples

# block randomization of 12 subjects for a reference replicate study
# and demonstration of the S3 print method
rl <- RL4(nsubj=12, blocksize=6, seqs=c("TRR","RTR","RRT"), seed=0)
print(rl, sumry=TRUE)



