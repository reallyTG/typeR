library(PST)


### Name: generate
### Title: Generate sequences using a probabilistic suffix tree
### Aliases: generate generate,PSTf-method
### Keywords: datagen methods

### ** Examples

data(s1)
s1.seq <- seqdef(s1)
S1 <- pstree(s1.seq, L=3)

## Generating 10 sequences
generate(S1, n=10, l=10, method="prob")

## First state is generated with p(a)=0.9 and p(b)=0.1
generate(S1, n=10, l=10, method="prob", p1=c(0.9, 0.1))



