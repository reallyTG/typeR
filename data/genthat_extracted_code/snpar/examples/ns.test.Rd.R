library(snpar)


### Name: ns.test
### Title: Normal Score (Van der Waerden) Test
### Aliases: ns.test
### Keywords: nstest

### ** Examples

# one-sample test
x <- c(14.22, 15.83, 17.74, 19.88, 20.42, 21.96, 22.33, 22.79, 23.56, 24.45)
ns.test(x, q = 19)

# two-sample test
y <- c(5.54, 5.52, 5.00, 4.89, 4.95, 4.85, 4.80, 4.78, 4.82, 4.85, 4.72, 4.48, 
       4.39, 4.36, 4.30, 4.26, 4.25, 4.22)
group <- gl(2,9)
## independent two-sample test
ns.test(y, group)
## paired two-sample test
ns.test(y,group, paired = TRUE)

# multiple-sample test
z <- c(10.7, 10.8, 10.5, 10.9, 9.7, 14.5, 12.2, 12.4, 12.8, 12.7, 15.2, 12.3, 
       13.5, 14.7, 15.6)
gr <- gl(3,5)
ns.test(z, gr, compared = TRUE)



