library(gbutils)


### Name: isargunnamed
### Title: Is an element of a list named?
### Aliases: isargunnamed
### Keywords: programming

### ** Examples

li1 <- list(a=1, 2, 3)
isargunnamed(li1, 1)
isargunnamed(li1, 2)

## wholly unnamed list
li2 <- list(1, 2, 3)
isargunnamed(li2, 1)
isargunnamed(li2, 2)

## using in a function definition
f1 <- function(...){
    dots <- list(...)
    for(i in seq(along=dots))
        cat(i, isargunnamed(dots, i), "\n")
}

f1(1)
f1(a = 3, 4, c = 5)
f1(x = "a", y = "b")



