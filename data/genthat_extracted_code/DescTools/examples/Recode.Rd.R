library(DescTools)


### Name: Recode
### Title: Recode a Factor
### Aliases: Recode
### Keywords: manip

### ** Examples

set.seed(1984)
x <- factor(sample(1:15, 20, replace=TRUE))
levels(x) <- paste("old", levels(x), sep="_")

y <- Recode(x,
            "new_1" = c("old_1","old_4","old_5"),
            "new_2" = c("old_6","old_10","old_11"),
            "new_3" = c("old_12","old_13"),
            elselevel="other")
data.frame(x=x, y=y)


x <- factor(letters[1:6])

z1 <- Recode(x, AB=c("a","b"), CD=c("c","d"), elselevel="none of these")
z2 <- Recode(x, AB=c("a","b"), CD=c("c","d"), elselevel=NA)
z3 <- Recode(x, AB=c("a","b"), CD=c("c","d"), elselevel=NULL)
z4 <- Recode(x, AB=c("a","b"), GH=c("g","h"), elselevel=NA, use.empty=TRUE)
z5 <- Recode(x, AB=c("a","b"), GH=c("g","h"), elselevel=NA, use.empty=FALSE)

data.frame(z1, z2, z3, z4, z5)

lapply(data.frame(z1, z2, z3, z4, z5), levels)

# empty level GH exists in z4...
table(z4, useNA="ifany")
# and is dropped in z5
table(z5, useNA="ifany")

# use integers to define the groups to collapse
set.seed(1972)
(likert <- factor(sample(1:10, size=15, replace=TRUE),
                 levels=1:10, labels=gettextf("(%s)", 1:10)))
Recode(likert, det=1:6, pas=7:8, pro=9:10)
# or directly turned to numeric
Recode(likert, "1"=1:6, "2"=7:8, "5"=9:10, num=TRUE)



