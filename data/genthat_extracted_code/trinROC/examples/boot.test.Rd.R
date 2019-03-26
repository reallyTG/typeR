library(trinROC)


### Name: boot.test
### Title: Bootstrap test for three-class ROC data
### Aliases: boot.test

### ** Examples

data(cancer)
data(krebs)

# investigate a single marker:
boot.test(dat = krebs[,c(1,2)], n.boot=500)

# result is equal to:
x1 <- with(krebs, krebs[trueClass=="healthy", 2])
y1 <- with(krebs, krebs[trueClass=="intermediate", 2])
z1 <- with(krebs, krebs[trueClass=="diseased", 2])
## No test: 
 boot.test(x1, y1, z1, n.boot=500) 
## End(No test)

# comparison of marker 2 and 6:
## No test: 
 boot.test(dat = krebs[,c(1,2,5)], paired = TRUE) 
## End(No test)

# result is equal to:
x2 <- with(krebs, krebs[trueClass=="healthy", 5])
y2 <- with(krebs, krebs[trueClass=="intermediate", 5])
z2 <- with(krebs, krebs[trueClass=="diseased", 5])
## No test: 
 boot.test(x1, y1, z1, x2, y2, z2, paired = TRUE) 
## End(No test)



