library(multcompView)


### Name: multcompTs
### Title: "T" depiction of undiffentiated classes
### Aliases: multcompTs
### Keywords: dplot

### ** Examples

##
## 0.  Conference presentation comparing Ts and Letters
##
dir(system.file('doc', package='multcompView'),
    pattern='\\.pdf$', full.name=TRUE)

##
## 1.  logical vector indicating different pairs
##
dif3 <- c(FALSE, FALSE, TRUE)
names(dif3) <- c("a-b", "a-c", "b-c")
multcompTs(dif3)

##
## 2.  numeric vector indicating statistical significance
##
dif4 <- c(.01, .02, .03, 1)
names(dif4) <- c("a-b", "a-c", "b-d", "a-d")
(diff4.T <- multcompTs(dif4))
plot(diff4.T)

##
## 3.  Distance matrix
##
dJudge <- dist(USJudgeRatings)
dJt <- multcompTs(dJudge, compare='>', threshold = median(dJudge))
# comparison of 43 judges;  compact but undecipherable:
plot(dJt, cex.axis=.5)

x <- array(1:9, dim=c(3,3),
   dimnames=list(LETTERS[1:3], NULL) )
d3 <- dist(x)
dxTs <- multcompTs(d3, compare=">", threshold=2)
plot(dxTs)

d3d <- dist(x, diag=TRUE)
dxdTs <- multcompTs(d3d, compare=">", threshold=2)

## Don't show: 
stopifnot(
## End(Don't show)
all.equal(dxTs, dxdTs)
## Don't show: 
)
## End(Don't show)

d3u <- dist(x, upper=TRUE)
dxuTs <- multcompTs(d3d, compare=">", threshold=2)

## Don't show: 
stopifnot(
## End(Don't show)
all.equal(dxTs, dxuTs)
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
cxTs <- multcompTs(abs(cx), threshold=.3)
plot(cxTs)



