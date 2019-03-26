library(ClassComparison)


### Name: MultiWilcoxonTest-class
### Title: Class "MultiWilcoxonTest"
### Aliases: MultiWilcoxonTest MultiWilcoxonTest-class
###   countSignificant,MultiWilcoxonTest-method
###   cutoffSignificant,MultiWilcoxonTest-method
###   hist,MultiWilcoxonTest-method plot,MultiWilcoxonTest,missing-method
###   selectSignificant,MultiWilcoxonTest-method
###   summary,MultiWilcoxonTest-method
### Keywords: classes htest multivariate

### ** Examples

showClass("MultiWilcoxonTest")
ng <- 10000
ns <- 15
nd <- 200
fake.class <- factor(rep(c('A', 'B'), each=ns))
fake.data <- matrix(rnorm(ng*ns*2), nrow=ng, ncol=2*ns)
fake.data[1:nd, 1:ns] <- fake.data[1:nd, 1:ns] + 2
fake.data[(nd+1):(2*nd), 1:ns] <- fake.data[(nd+1):(2*nd), 1:ns] - 2

a <- MultiWilcoxonTest(fake.data, fake.class)
hist(a)
plot(a)
plot(a, prior=0.85)
abline(h=0)

cutoffSignificant(a, prior=0.85, signif=0.95)
countSignificant(a, prior=0.85, signif=0.95)



