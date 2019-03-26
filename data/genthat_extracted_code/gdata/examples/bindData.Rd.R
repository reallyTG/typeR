library(gdata)


### Name: bindData
### Title: Bind two data frames into a multivariate data frame
### Aliases: bindData
### Keywords: manip misc

### ** Examples

n1 <- 6
n2 <- 12
n3 <- 4
## Single trait 1
num <- c(5:n1, 10:13)
(tmp1 <- data.frame(y1=rnorm(n=n1),
                    f1=factor(rep(c("A", "B"), n1/2)),
                    ch=letters[num],
                    fa=factor(letters[num]),
                    nu=(num) + 0.5,
                    id=factor(num), stringsAsFactors=FALSE))

## Single trait 2 with repeated records, some subjects also in tmp1 
num <- 4:9
(tmp2 <- data.frame(y2=rnorm(n=n2),
                    f2=factor(rep(c("C", "D"), n2/2)),
                    ch=letters[rep(num, times=2)],
                    fa=factor(letters[rep(c(num), times=2)]),
                    nu=c((num) + 0.5, (num) + 0.25),
                    id=factor(rep(num, times=2)), stringsAsFactors=FALSE))

## Single trait 3 with completely distinct set of subjects
num <- 1:4
(tmp3 <- data.frame(y3=rnorm(n=n3),
                    f3=factor(rep(c("E", "F"), n3/2)),
                    ch=letters[num],
                    fa=factor(letters[num]),
                    nu=(num) + 0.5,
                    id=factor(num), stringsAsFactors=FALSE))

## Combine all datasets
(tmp12 <- bindData(x=tmp1, y=tmp2, common=c("id", "nu", "ch", "fa")))
(tmp123 <- bindData(x=tmp12, y=tmp3, common=c("id", "nu", "ch", "fa")))

## Sort by subject
tmp123[order(tmp123$ch), ]



