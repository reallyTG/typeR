library(gaston)


### Name: association.test
### Title: Association Test
### Aliases: association.test
### Keywords: Association Test

### ** Examples

## No test: 
# Load data
data(TTN)
x <- as.bed.matrix(TTN.gen, TTN.fam, TTN.bim)
standardize(x) <- "p"

# simulate quantitative phenotype with effect of SNP #631 and a polygenic component 
set.seed(1)
y <- x %*% c(rep(0,630),0.5,rep(0,ncol(x)-631)) + rnorm(nrow(x))

# association test with linear model 
test <- association.test(x, y, method="lm", response = "quanti")

# a p-values qq plot
qqplot.pvalues(test)

# a small Manhattan plot 
# hihlighting the link between p-values and LD with SNP #631
lds <- LD(x, 631, c(1,ncol(x)))
manhattan(test, col = rgb(lds,0,0), pch = 20)

# use y to simulate a binary phenotype
y1 <- as.numeric(y > mean(y))

# logistic regression
t_binary <- association.test(x, y1, method = "lm", response = "binary")
# another small Manhattan plot
manhattan(t_binary, col = rgb(lds,0,0), pch = 20)

## End(No test)


