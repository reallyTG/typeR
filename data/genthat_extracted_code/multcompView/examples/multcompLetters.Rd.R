library(multcompView)


### Name: multcompLetters
### Title: Letter summary of similarities and differences
### Aliases: multcompLetters multcompLetters2 multcompLetters3
###   multcompLetters4
### Keywords: dplot

### ** Examples

##
## 1.  a logical vector indicating signficant differences
##
dif3 <- c(FALSE, FALSE, TRUE)
names(dif3) <- c("A-B", "A-C", "B-C")
dif3L <- multcompLetters(dif3)
dif3L
print(dif3L)
print(dif3L, TRUE)

##
## 2.  numeric vector indicating statistical significance
##
dif4 <- c(.01, .02, .03, 1)
names(dif4) <- c("a-b", "a-c", "b-d", "a-d")
(diff4.T <- multcompLetters(dif4))

(dif4.L1 <- multcompLetters(dif4,
       Letters=c("*", ".")))
# "Letters" can be any character strings,
# but they should be recognizable when
# concatonated.

##
## 3.  distance matrix
##
dJudge <- dist(USJudgeRatings)
dJl <- multcompLetters(dJudge, compare='>', threshold = median(dJudge))
# comparison of 43 judges;  compact but undecipherable:
dJl

x <- array(1:9, dim=c(3,3),
   dimnames=list(LETTERS[1:3], NULL) )
d3 <- dist(x)
dxLtrs <- multcompLetters(d3, compare=">", threshold=2)

d3d <- dist(x, diag=TRUE)
dxdLtrs <- multcompLetters(d3d, compare=">", threshold=2)

## Don't show: 
stopifnot(
## End(Don't show)
all.equal(dxLtrs, dxdLtrs)
## Don't show: 
)
## End(Don't show)

d3u <- dist(x, upper=TRUE)
dxuLtrs <- multcompLetters(d3d, compare=">", threshold=2)

## Don't show: 
stopifnot(
## End(Don't show)
all.equal(dxLtrs, dxuLtrs)
## Don't show: 
)
## End(Don't show)

##
## 4.  cor matrix
##
set.seed(4)
x100 <- matrix(rnorm(100), ncol=5,
               dimnames=list(NULL, LETTERS[1:5]) )
cx <- cor(x100)
cxLtrs <- multcompLetters(abs(cx), threshold=.3)


##
##5. reversed
##

dif3 <- c(FALSE, FALSE, TRUE)
names(dif3) <- c("A-B", "A-C", "B-C")
dif3L <- multcompLetters(dif3)
dif3L.R <- multcompLetters(dif3, rev = TRUE)
dif3L
dif3L.R


##
##6. multcompletters2 usage

experiment <- data.frame(treatments = gl(11, 20, labels = c("dtl", "ctrl", "treat1",
              "treat2", "treatA2", "treatB", "treatB2",
              "treatC", "treatD", "treatA1", "treatX")),
              y = c(rnorm(20, 10, 5), rnorm(20, 20, 5), rnorm(20, 22, 5), rnorm(20, 24, 5),
               rnorm(20, 35, 5), rnorm(20, 37, 5), rnorm(20, 40, 5), rnorm(20, 43, 5),
               rnorm(20, 45, 5), rnorm(20, 60, 5), rnorm(20, 60, 5)))
exp_tukey <- TukeyHSD(exp_aov <- aov(y  ~ treatments, data = experiment))
exp_letters1 <- multcompLetters(exp_tukey$treatments[,4])
exp_letters1
#Notice lowest mean treatments gets a "e"
#Ordered letters
multcompLetters2(y ~ treatments, exp_tukey$treatments[,"p adj"], experiment)
multcompLetters2(y ~ treatments, exp_tukey$treatments[,"p adj"], experiment, reversed = TRUE)

##7. multcompletters3 usage

multcompLetters3("treatments", "y", exp_tukey$treatments[,"p adj"], experiment)

##8. multcompletters4 usage


multcompLetters4(exp_aov, exp_tukey)



