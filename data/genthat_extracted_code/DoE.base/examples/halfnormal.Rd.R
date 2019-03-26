library(DoE.base)


### Name: halfnormal
### Title: Creation of half normal effects plots and numeric methods for
###   significance assessment
### Aliases: halfnormal halfnormal.default halfnormal.lm halfnormal.design
###   null.check orth.check ME.Lenth CME.LW98 CME.EM08
### Keywords: design array

### ** Examples

### critical values
b <- rnorm(12)
ME.Lenth(b)
ME.Lenth(b)$ME
ME.Lenth(b, alpha=0.22)
ME.Lenth(b, alpha=0.123)
ME.Lenth(b, alpha=0.12)
ME.Lenth(rnorm(144), alpha=0.1)
(mel <- ME.Lenth(b, alpha=0.1))
## assuming an external effect standard error based on 3df
## Not run: CME.EM08(b, 0.1, 3, alpha=0.1)    
         ## does not run for saving CRAN check time 
         ## much smaller than Lenth, if external 
         ## standard error much smaller than s0 (see mel)

### Half normal plots
## the default method
halfnormal(rnorm(15), labs=paste("b",1:15,sep=""))
b <- c(250, 8,7,6, rnorm(11))
halfnormal(b, labs=paste("b",1:15,sep=""))
halfnormal(b, labs=paste("b",1:15,sep=""), large.omit=1)

## the design method, saturated main effects design
plan <- oa.design(L12.2.11)
halfnormal(add.response(plan,rnorm(12)))

## the design method, saturated main effects design, 
## partial aliasing due to a missing value
y <- c(NA, rnorm(11))
## the following line would yield an error, because there is even 
## complete aliasing among main effects: 
## Not run: halfnormal(lm(y~., add.response(plan, y)), ME.partial=TRUE)
## this can only be helped by omitting a main effect from the model;
## afterwards, there is still partial aliasing,
## which must be explicitly permitted by the ME.partial option:
halfnormal(lm(y~.-D, add.response(plan, y)), ME.partial=TRUE)

## the linear model method
yc <- rnorm(12)
## partial aliasing only
halfnormal(lm(yc~A+B+C+D+E+F+G+H+J+A:B, plan))
## both partial (A:B) and complete (E:F) aliasing are present
halfnormal(lm(yc~A+B+C+D+E+F+G+H+J+A:B+E:F, plan))
## complete aliasing only because of the missing value in the response
halfnormal(lm(y~A+B+C+D+E+F+G+H+J+A:B+E:F, plan),ME.partial=TRUE)
## omit a large dominating effect

halfnormal(lm(y~A+B+C+D+E+F+G+H+J+A:B+E:F, plan),ME.partial=TRUE)


## a regular fractional factorial design with center points
y20 <- rnorm(20)
## Not run: halfnormal(lm(y20~.^2, FrF2(16,7,ncenter=4)))



