library(qdapTools)


### Name: list2df
### Title: List/Matrix/Vector to Dataframe/List/Matrix
### Aliases: list2df matrix2df vect2df list_df2df list_vect2df counts2list
###   vect2list df2matrix matrix2long
### Keywords: collapse list

### ** Examples

lst1 <- list(x=c("foo", "bar"), y=1:5)
list2df(lst1)

lst2 <- list(a=c("hello", "everybody"), b = mtcars[1:6, 1])
list2df(lst2, "col 1", "col 2")

matrix2df(mtcars)
matrix2df(cor(mtcars))
matrix2df(matrix(1:9, ncol=3))

vect2df(1:10)
vect2df(c(table(mtcars[, "gear"])))

list_df2df(list(mtcars, mtcars))

L1 <- list(a=1:10, b=1:6, c=5:8)
list_vect2df(L1)

L2 <- list(
  months=setNames(1:12, month.abb),
  numbers=1:6, 
  states=setNames(factor(state.name[1:4]), state.abb[1:4])
)

list_vect2df(L2)

set.seed(10)
cnts <- data.frame(month=month.name,
    matrix(sample(0:2, 36, TRUE), ncol=3))

counts2list(cnts[, -1], cnts[, 1])
df2matrix(cnts)
counts2list(df2matrix(cnts))
counts2list(t(df2matrix(cnts)))

mat <- matrix(1:9, ncol=3)
matrix2long(mat)
matrix2long(mtcars)

## Not run: 
##D library(qdap)
##D term <- c("the ", "she", " wh")
##D (out <- with(raj.act.1,  termco(dialogue, person, term)))
##D x <- counts(out)
##D 
##D counts2list(x[, -c(1:2)], x[, 1])
## End(Not run)

vect2list(LETTERS[1:10])
vect2list(LETTERS[1:10], numbered.names = TRUE)
x <- setNames(LETTERS[1:4], paste0("Element_", 1:4))
vect2list(x)
vect2list(x, FALSE)
vect2list(x, FALSE, TRUE)



