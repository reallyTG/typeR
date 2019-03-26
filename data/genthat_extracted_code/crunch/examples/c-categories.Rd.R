library(crunch)


### Name: c-categories
### Title: S3 method to concatenate Categories and Category objects
### Aliases: c-categories c.Categories c.Category

### ** Examples

cat.a <- Category(name="First", id=1, numeric_value=1, missing=FALSE)
cat.b <- Category(name="Second", id=2)
cat.c <- Category(name="Third", id=3, missing=TRUE)
cats.1 <- Categories(cat.a, cat.b)
identical(cats.1, c(cat.a, cat.b))
identical(c(cats.1, cat.c), Categories(cat.a, cat.b, cat.c))



