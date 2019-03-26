library(matsbyname)


### Name: fractionize_byname
### Title: Compute fractions of matrix entries
### Aliases: fractionize_byname

### ** Examples

M <- matrix(c(1, 5,
              4, 5),
            nrow = 2, ncol = 2, byrow = TRUE, 
            dimnames = list(c("p1", "p2"), c("i1", "i2"))) %>% 
            setcoltype("Products") %>% setrowtype("Industries")
fractionize_byname(M, margin = c(1,2))
fractionize_byname(M, margin = 1)
fractionize_byname(M, margin = 2)



