library(hashmap)


### Name: Hashmap-class
### Title: Internal hash map class
### Aliases: Hashmap-class Hashmap

### ** Examples


x <- replicate(10e3,
    paste0(sample(letters, 12, TRUE),
           collapse = "")
)
y <- rnorm(length(x))
z <- sample(x, 100)

H <- hashmap(x, y)

H$empty()       #[1] FALSE
H$size()        #[1] 10000

## necessarily
any(duplicated(H$keys()))        #[1] FALSE

all.equal(H[[z]], H$find(z))  #[1] TRUE

## hash map ordering is random
all.equal(
    sort(H[[x]]),
    sort(H$values()))  #[1] TRUE

## a named vector
head(H$data())

## redundant, but TRUE
all.equal(
    H[[names(head(H$data()))]],
    unname(head(H$data())))

## setting values
H2 <- hashmap(H$keys(), H$values())

all.equal(
    sort(H[[H2$keys()]]),
    sort(H2[[H$keys()]]))   #[1] TRUE

H$insert("A", round(pi, 5))

H2[["A"]] <- round(pi, 5)

## still true
all.equal(
    sort(H[[H2$keys()]]),
    sort(H2[[H$keys()]]))

## changing SEXPTYPE of key or value must be explicit
H3 <- hashmap(c("A", "B", "C"), c(1, 2, 3))

H3$size()     #[1] 3

H3$clear()
H3$size()     #[1] 0

## not allowed
class(try(H3[["D"]] <- "text", silent = TRUE)) #[1] "try-error"

## okay
H3$renew("D", "text")
H3$size()     #[1] 1





