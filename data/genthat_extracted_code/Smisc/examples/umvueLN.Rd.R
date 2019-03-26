library(Smisc)


### Name: umvueLN
### Title: Computes UMVUEs of lognormal parameters
### Aliases: umvueLN
### Keywords: misc

### ** Examples


# Test from Gilbert 1987, Example 13.1, p 166
x <- c(3.161, 4.151, 3.756, 2.202, 1.535, 20.76, 8.42, 7.81, 2.72, 4.43)
y <- umvueLN(x)
print(y, digits = 8)

# Compare to results from PRO-UCL 4.00.02:

# MVU Estimate of Mean                     5.6544289
# MVU Estimate of Standard Error of Mean   1.3944504
# MVU Estimate of SD                       4.4486438

# Compare these to Gilbert's printed results (which have rounding error)
Gilbert <- c(5.66, sqrt(1.97), sqrt(19.8))
print(round(abs(y - Gilbert), 2))



