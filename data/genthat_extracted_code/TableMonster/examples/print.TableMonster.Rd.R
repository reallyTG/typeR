library(TableMonster)


### Name: print.TableMonster
### Title: Easy Generation of 'booktab' tables
### Aliases: print.TableMonster

### ** Examples

## Example 1: A table with a single heading
##
library(TableMonster)
tst <- as.data.frame(cbind(rep(c("John","Joe","Mary","Jane","Alex"), 2),
                     rep(c("male","male","female","female","female"), 2),
                     rep(c(12345, 54321, 46943, 23123, 51234), 2)))


hdngs <- as.list(rep("", 3))
names(hdngs) <- c("Name", "Gender", "Student ID")

tmHeadings(tst) <- hdngs
tmCtypes(tst) <- rep("n",3)
tmDigits(tst) <- rep(0,3)
tmCaption(tst) <-"This is JUST a TEST"

class(tst) <- "TableMonster"

tst

print(tst, label="tbl:anexample")
print(tst, include.rownames=FALSE, sanitize.text.function=I)
print(tst, label="tbl:anexample", include.rownames=FALSE, sanitize.text.function=I)

## Example 2: A table with a two level heading
##
library(TableMonster)
gp <- rep(1:2,each=5)
m1 <- rnorm(10)
s1 <- (rchisq(10, df=1)/10)^0.5
z1 <- m1/s1
m2 <- rnorm(10)
s2 <- (rchisq(10, df=1)/10)^0.5
z2 <- m2/s2
m3 <- rnorm(10)
s3 <- (rchisq(10, df=1)/10)^0.5
z3 <- m3/s3

foo <- as.data.frame(list(variable=letters[sample(10)], group=gp, model1=m1, se1=s1, Z1=z1,
                                                             model2=m2, se2=s2, Z2=z2,
                                                             model3=m3, se3=s3, Z3=z3))

tmHeadings(foo) <- list('Variable'="", 'Group'="",
                        'Model 1'=list('Estimate'="", 'Std Err'="", 'Wald Test'=""),
                        'Model 2'=list('Estimate'="", 'Std Err'="", 'Wald Test'=""),
                        'Model 3'=list('Estimate'="", 'Std Err'="", 'Wald Test'=""))
tmCaption(foo) <- "This is TableMonster (TM)!!!"
                             
tmCtypes(foo) <- c("c","c",rep("n",9))
tmDigits(foo) <- c(0, 0, rep(3, 9))

class(foo) <- "TableMonster"

print(foo, rowcolor=list(color="yellow", rownum=7))



