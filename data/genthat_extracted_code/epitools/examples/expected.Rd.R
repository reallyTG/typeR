library(epitools)


### Name: expected
### Title: Expected values in a table
### Aliases: expected
### Keywords: manip

### ** Examples

##From Selvin, 2001, p.2
##year = year of birth
##one+ = one or more congenital defects
##one = one congenital defect
dat <- c(369, 460, 434, 434, 506, 487, 521, 518, 526, 488,
605, 481, 649, 477, 733, 395, 688, 348)

##observed
oi <- matrix(dat, nrow =2)
colnames(oi) <- 1983:1991
rownames(oi) <- c("one+", "one")

##expected
ei <- expected(oi)

##Pearson chi-square test 
chi2.T <- sum((oi - ei)^2/ei)
pchisq(q = chi2.T, df = 8, lower.tail = FALSE)




