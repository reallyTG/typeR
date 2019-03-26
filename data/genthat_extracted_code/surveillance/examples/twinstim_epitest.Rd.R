library(surveillance)


### Name: twinstim_epitest
### Title: Permutation Test for Space-Time Interaction in '"twinstim"'
### Aliases: epitest coef.epitest plot.epitest
### Keywords: htest

### ** Examples

data("imdepi", "imdepifit")

## test for space-time interaction of the B-cases
## assuming spatial interaction to be constant within 50 km
imdepiB50 <- update(subset(imdepi, type == "B"), eps.s = 50)
imdfitB50 <- update(imdepifit, data = imdepiB50,
                    epidemic = ~1, epilink = "identity", siaf = NULL,
                    start = c("e.(Intercept)" = 0))

## simple likelihood ratio test
epitest(imdfitB50, imdepiB50, method = "LRT")

## permutation test (only a few permutations for speed)
et <- epitest(imdfitB50, imdepiB50, B = 3 + 26*surveillance.options("allExamples"),
              verbose = 2 * (.Platform$OS.type == "unix"),
              .seed = 1, .parallel = 1 + surveillance.options("allExamples"))
et
plot(et)
## evidence against the null hypothesis of no space-time interaction

summary(coef(et, which = "m1"))



