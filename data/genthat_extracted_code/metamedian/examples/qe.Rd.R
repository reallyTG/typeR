library(metamedian)


### Name: qe
### Title: Meta-Analysis via quantile estimation method
### Aliases: qe

### ** Examples

## Example 1: Meta-analysis of one-group studies

## Storing data
## Note: All 6 studies report S2
med.vals <- c(6.1, 5.2, 3.1, 2.8, 4.5)
q1.vals <- c(2.0, 1.6, 2.6, 0.9, 3.2)
q3.vals <- c(10.2, 13.0, 8.3, 8.2, 9.9)
n.vals <- c(100, 92, 221, 81, 42)

## Meta-analyze studies via QE method
qe(q1.g1 = q1.vals, med.g1 = med.vals, q3.g1 = q3.vals, n.g1 = n.vals)


## Example 2: Meta-analysis of one-group studies

## Storing data
## Note: Studies 1, 2, 3, and 4 report S1, S2, S3, and S4, respectively
min.vals <- c(0.7, NA, 1.1, NA)
q1.vals <- c(NA, 5.2, 5.3, NA)
med.vals <- c(8.7, 10.7, 11.0, NA)
q3.vals <- c(NA, 5.2, 5.3, NA)
max.vals <- c(22.2, NA, 24.7, NA)
n.vals <- c(52, 34, 57, 90)
sd.vals <- c(NA, NA, NA, 4.2)
mean.vals <- c(NA, NA, NA, 12.2)

## Meta-analyze studies via QE method
qe(min.g1 = min.vals, q1.g1 = q1.vals, med.g1 = med.vals, q3.g1 = q3.vals,
   max.g1 = max.vals, n.g1 = n.vals, mean.g1 = mean.vals, sd.g1 = sd.vals)


## Example 3: Meta-analysis of two-group studies

## Storing data
## Note: All 4 studies report S3
min.g1 <- c(2.3, 3.2, 1.9, 1.7)
q1.g1 <- c(6.0, 7.1, 3.5, 3.8)
med.g1 <- c(8.7, 9.5, 5.9, 6.0)
q3.g1 <- c(11.3, 13.1, 10.8, 11.0)
max.g1 <- c(20.6, 25.3, 17.0, 18.6)
n.g1 <- c(53, 49, 66, 75)
min.g2 <- c(0.4, 0.9, 0.5, 0.3)
q1.g2 <- c(2.5, 3.1, 2.7, 2.3)
med.g2 <- c(5.1, 6.2, 4.9, 4.7)
q3.g2 <- c(9.6, 10.1, 8.8, 9.2)
max.g2 <- c(20.2, 21.4, 18.8, 19.2)
n.g2 <- c(50, 45, 60, 73)

## Meta-analyze studies via QE method
qe(min.g1 = min.g1, q1.g1 = q1.g1, med.g1 = med.g1, q3.g1 = q3.g1,
   max.g1 = max.g1, n.g1 = n.g1, min.g2 = min.g2, q1.g2 = q1.g2,
   med.g2 = med.g2, q3.g2 = q3.g2, max.g2 = max.g2, n.g2 = n.g2)




