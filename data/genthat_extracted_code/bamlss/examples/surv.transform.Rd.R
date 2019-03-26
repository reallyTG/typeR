library(bamlss)


### Name: surv.transform
### Title: Survival Model Transformer Function
### Aliases: surv.transform
### Keywords: regression survival

### ** Examples

library("survival")
set.seed(111)

## Simulate survival data.
d <- simSurv(n = 20)

## Formula of the survival model, note
## that the baseline is given in the first formula by s(time).
f <- list(
  Surv(time, event) ~ s(time) + s(time, by = x3),
  gamma ~ s(x1) + s(x2)
)

## Create the bamlss.frame.
bf <- bamlss.frame(f, family = "cox", data = d)

## Lambda is the time-dependent parameter.
print(bf)

## Apply the transformer.
bf <- with(bf, surv.transform(x, y, data = model.frame,
  family = family, is.cox = TRUE, subdivisions = 25))

## Extract the time grid design matrix for term s(time).
X <- bf$x$lambda$smooth.construct[["s(time)"]]$fit.fun_timegrid(NULL)
dim(X)

## Compute fitted values for each time point.
grid <- attr(bf$y[[1]], "grid")
gdim <- c(length(grid), length(grid[[1]]))
b <- runif(ncol(X))
fit <- X 
fit <- matrix(fit, nrow = gdim[1], ncol = gdim[2], byrow = TRUE)

plot(as.vector(fit) ~ unlist(grid), type = "n",
  xlab = "Survival time", ylab = "Effect")
for(j in seq_along(grid)) {
  lines(fit[j, ] ~ grid[[j]], lwd = 2, col = rgb(0.1, 0.1, 0.1, alpha = 0.3))
  points(grid[[j]][gdim[2]], fit[j, gdim[2]], col = "red")
}



