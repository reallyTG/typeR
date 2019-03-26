library(useful)


### Name: build.x
### Title: build.x
### Aliases: build.x

### ** Examples

require(ggplot2)
head(mpg)
head(build.x(hwy ~ class + cyl + year, data=mpg))

testFrame <- data.frame(First=sample(1:10, 20, replace=TRUE), 
Second=sample(1:20, 20, replace=TRUE), 
Third=sample(1:10, 20, replace=TRUE), 
Fourth=factor(rep(c("Alice","Bob","Charlie","David"), 5)), 
Fifth=ordered(rep(c("Edward","Frank","Georgia","Hank","Isaac"), 4)), 
Sixth=factor(rep(c("a", "b"), 10)), stringsAsFactors=F)
head(build.x(First ~ Second + Fourth + Sixth, testFrame, 
contrasts=c("Fourth"=TRUE, "Fifth"=FALSE, "Sixth"=TRUE)))
head(build.x(First ~ Second + Fourth + Fifth + Sixth, testFrame, 
contrasts=c(Fourth=TRUE, Fifth=FALSE, Sixth=TRUE)))
head(build.x(First ~ Second + Fourth + Fifth + Sixth, testFrame, contrasts=TRUE))
head(build.x(First ~ Second + Fourth + Fifth + Sixth, testFrame, 
contrasts=FALSE))
head(build.x(First ~ Second + Fourth + Fifth + Sixth - 1, testFrame, 
contrasts=TRUE))
build.x(First ~ Second + Fourth + Fifth + Sixth - 1, testFrame, 
contrasts=TRUE, sparse=TRUE)
head(build.x(First ~ Second + Fourth + Fifth + Fourth*Sixth, testFrame, contrasts=TRUE))
head(build.x(First ~ Second + Fourth + Fifth + Third*Sixth, testFrame, contrasts=TRUE))
#' head(build.x(First ~ Second + Fourth + Fifth + Fourth*Sixth, testFrame, contrasts=FALSE))
head(build.x(First ~ Second + Fourth + Fifth + Third*Sixth, testFrame, contrasts=FALSE))
build.x(First ~ Second + Fourth + Fifth + Third*Sixth, testFrame, contrasts=FALSE, sparse=TRUE)

## if contrasts is a list then you can specify just certain factors



