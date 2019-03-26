library(PMCMRplus)


### Name: spearmanTest
### Title: Testing against Ordered Alternatives (Spearman Test)
### Aliases: spearmanTest spearmanTest.default spearmanTest.formula
### Keywords: htest nonparametric

### ** Examples

## Example from Sachs (1997, p. 402)
x <- c(106, 114, 116, 127, 145,
       110, 125, 143, 148, 151,
       136, 139, 149, 160, 174)
g <- gl(3,5)
levels(g) <- c("A", "B", "C")

## Chacko's test
chackoTest(x, g)

## Cuzick's test
cuzickTest(x, g)

## Johnson-Mehrotra test
johnsonTest(x, g)

## Jonckheere-Terpstra test
jonckheereTest(x, g)

## Le's test
leTest(x, g)

## Spearman type test
spearmanTest(x, g)

## Murakami's BWS trend test
bwsTrendTest(x, g)




