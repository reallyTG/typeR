library(EngrExpt)


### Name: cure
### Title: Yield from a chemical curing process
### Aliases: cure
### Keywords: datasets

### ** Examples

str(cure)
dotplot(temp ~ yield, cure, groups = time, type = c("p","a"),
        jitter.y = TRUE, xlab = "Yield of parts")
summary(fm1 <- lm(yield ~ time * temp, cure))



