library(hint)


### Name: hint-package
### Title: The 'hint' package
### Aliases: hint-package hint
### Keywords: package distribution htest univar

### ** Examples

## Generate a hypergeometric intersection distribution and plot it.
dd <- dhint(110, c(65, 71))
plotDistr(dd)

## Allow duplicates in the second urn and add the distributions to the existing plot.
dd <- dhint(110, c(65, 71), 82)
dd2 <- dhint(59, c(44, 28), 47)
add.distr(dd, dd2, cols = c("blue", "darkgreen"))

## Test whether the intersection of categories in data sets is significant and plot the result:
dd <- data.frame(letters[1:20], rep(1,20), rep(1,20))
tt <- hint.test(dd, letters[1:9], letters[4:15], alternative = "greater")
plot(tt)

## Allow duplicates in the second urn.
dd <- data.frame(letters[1:20], rep(1,20), c(rep(1,4),rep(2,16)))
tt <- hint.test(dd, letters[1:9], letters[9:14], alternative = "less")
plot(tt)




