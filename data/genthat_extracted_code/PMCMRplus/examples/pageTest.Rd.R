library(PMCMRplus)


### Name: pageTest
### Title: Page Rank Sum Test
### Aliases: pageTest pageTest.default
### Keywords: htest nonparametric

### ** Examples

## Sachs (1997), pp. 671 ff.
## 9 reviewers (blocks)
## assigned ranks to 4 objects (groups).
data(reviewers)
## See Sachs (1997) p. 677
pageTest(reviewers, alternative = "greater")




