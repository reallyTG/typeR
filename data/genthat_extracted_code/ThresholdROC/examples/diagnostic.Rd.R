library(ThresholdROC)


### Name: diagnostic
### Title: Diagnostic tests
### Aliases: diagnostic
### Keywords: diagnostic test

### ** Examples

# example 1 (Zhou et al (2002))
japan <- matrix(c(56, 23, 6, 78), ncol=2, byrow=TRUE)
colnames(japan) <- c("D","nD")
rownames(japan) <- c("+","-")
japan
p <- 0.196 # disease prevalence
diagnostic(japan, "par", casecontrol=TRUE, p=p)

# example 2
table <- matrix(c(22, 2, 3, 3), ncol=2, byrow=TRUE)
diagnostic(table, "par")
diagnostic(table, "exact")

# example 3
table2 <- matrix(c(22,2,0,3), ncol=2, byrow=TRUE)
diagnostic(table2, "exact")

# example 4
# generate a random sample of diseased and non-diased subjects
n1 <- 100
n2 <- 100
set.seed(1234)
par1.1 <- 0
par1.2 <- 1
par2.1 <- 2
par2.2 <- 1
k1 <- rnorm(n1, par1.1, par1.2) # non-diseased
k2 <- rnorm(n2, par2.1, par2.2) # diseased
# threshold estimation
rho <- 0.2 # prevalence
thres <- thres2(k1, k2, rho, method="eq", ci.method="d")$T$thres
# diagnostic test using the threshold estimate
marker <- c(k1, k2) # biomarker
condition <- c(rep("nD", length(k1)), rep("D", length(k2))) # condition
test <- ifelse(marker<thres, "-", "+") # test outcome according to thres
# build the table
table3 <- table(test, condition)[2:1, ]
# diagnostic test
round(diagnostic(table3), 3)



