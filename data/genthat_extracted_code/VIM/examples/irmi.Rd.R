library(VIM)


### Name: irmi
### Title: Iterative robust model-based imputation (IRMI)
### Aliases: irmi
### Keywords: manip

### ** Examples


data(sleep)
irmi(sleep)

data(testdata)
imp_testdata1 <- irmi(testdata$wna,mixed=testdata$mixed)

# mixed.constant != 0 (-10)
testdata$wna$m1[testdata$wna$m1==0] <- -10
testdata$wna$m2 <- log(testdata$wna$m2+0.001)
imp_testdata2 <- irmi(testdata$wna,mixed=testdata$mixed,mixed.constant=c(-10,log(0.001)))
imp_testdata2$m2 <- exp(imp_testdata2$m2)-0.001

#example with fixed formulas for the variables with missing
form=list(
NonD=c("BodyWgt","BrainWgt"),
Dream=c("BodyWgt","BrainWgt"),
Sleep=c("BrainWgt"),
Span=c("BodyWgt"),
Gest=c("BodyWgt","BrainWgt")
)
irmi(sleep,modelFormulas=form,trace=TRUE)

# Example with ordered variable
td <- testdata$wna
td$c1 <- as.ordered(td$c1)
irmi(td)




