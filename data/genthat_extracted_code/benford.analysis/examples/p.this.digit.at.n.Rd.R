library(benford.analysis)


### Name: p.this.digit.at.n
### Title: Probability of a digit at the nth position
### Aliases: p.this.digit.at.n

### ** Examples

p.this.digit.at.n(1,1) # 0.30103
p.this.digit.at.n(1,2) # 0.1138901
p.this.digit.at.n(9,3) # 0.09826716
matrix <- as.data.frame(round(sapply(1:4, function(x) sapply(0:9,p.this.digit.at.n,n=x)),5))
names(matrix) <- paste0("n=",1:4)
rownames(matrix) <- paste0("d=",0:9)
matrix # a table with the probabilities of digits 0 to 9 in positions 1 to 4.



