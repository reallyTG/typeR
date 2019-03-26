library(randomizeBE)


### Name: RL4
### Title: (Block) randomization of subjects, patients into sequence groups
### Aliases: RL4

### ** Examples

# block randomization of 12 subjects for a 2x2 cross-over using the defaults
# seqs = c("TR", "RT"), blocksize=4 and seed from Sys.time()
RL4(nsubj=12)

# block randomization of a full replicate design with randomly
# chosen blocksizes 2 or 4
rl <- RL4(nsubj=12, blocksize=c(2, 4), seqs=c("TRRT","RTTR"))
print(rl)

# randomization of 12 subjects for a 2x2 cross-over
# where the original random list don't pass the runs test
# watch the message.
RL4(nsubj=12, blocksize=0, seed=10)
#if you don't worry about some 'extreme' lists
RL4(nsubj=12, blocksize=0, seed=10, randctrl=FALSE)

# randomness control does'nt work that good in case of more 
# than 2 sequences: 3x3 latin square example
rl <- RL4(nsubj=12, seq <- c("ABC","BCA","CAB"), blocksize=3, seed=5125)
print(rl, sumry=TRUE)
# gives runs p.value=0.2502



