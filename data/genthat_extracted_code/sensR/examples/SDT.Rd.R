library(sensR)


### Name: SDT
### Title: Signal Detection Theory Computation of d-prime
### Aliases: SDT
### Keywords: models

### ** Examples

### Design table:
## 8  "yes"-responses to yes-samples
## 1  "yes"-responses to no-samples
## 17 "no"-response to yes-samples
## 24 "no"-responses to no-samples
## Note that response-class is columnwise and true-class is rowwise:
(mat <- rbind(c(8, 17),
              c(1, 24)))
SDT(mat, "logit")
SDT(mat, "probit")

## compare to AnotA():
m1 <- AnotA(8, 25, 1, 25)
m1

## Compute d-prime 'by hand':
## Hit rate and False alarm rates:
H <- 8/(8+17)
FA <- 1/(1+24)
zH <- qnorm(H)
zFA <- qnorm(FA)
## d-prime:
zH - zFA  # d'

## Don't show: 
  ## Testing correctness of examples:
  x <- as.vector(SDT(mat, "logit"))
  ## xx := dput(x)
  xx <- c(-0.75377180237638, -3.17805383034795, 2.42428202797157)
  stopifnot(isTRUE(all.equal(x, xx)))

  y <- as.vector(SDT(mat, "probit"))
  ## yy := dput(y)
  yy <- c(-0.467698799114508, -1.75068607125217, 1.28298727213766)
  stopifnot(isTRUE(all.equal(y, yy)))

  ## Test equality of all three d-prime computation methods:
  yy2 <- as.vector(coef(m1))
  yy3 <- zH - zFA
  stopifnot(isTRUE(all.equal(yy[3], yy2, yy3)))

## End(Don't show)

## Multi-response-class example (odor example from MacMillan and
## Creelman, 2005)
(odor <- matrix(c(112, 112, 72, 53, 22, 4, 7, 38, 50, 117, 101, 62), 2,
               byrow = TRUE))
obj <- SDT(odor)
ROC(obj[3,3])
## Don't show: 
  ## x := dput(as.vector(obj))
  x <- c(-0.528239188042123, 0.246450738699479, 0.804110201686501, 1.48077452682481,
  2.30203260833608, -2.08210003525935, -1.17498679206609, -0.664036943094355,
  0.164505352668462, 0.972771929727746, 1.55386084721722, 1.42143753076557,
  1.46814714478086, 1.31626917415635, 1.32926067860833)
  stopifnot(isTRUE(all.equal(x, as.vector(obj))))

## End(Don't show)



