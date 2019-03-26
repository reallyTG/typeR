library(spatstat)


### Name: fv
### Title: Create a Function Value Table
### Aliases: fv
### Keywords: spatial classes

### ** Examples

  df <- data.frame(r=seq(0,5,by=0.1))
  df <- transform(df, a=pi*r^2, b=3*r^2)
  X <- fv(df, "r", quote(A(r)),
              "a", cbind(a, b) ~ r,
              alim=c(0,4),
              labl=c("r", "%s[true](r)", "%s[approx](r)"),
              desc=c("radius of circle",
                     "true area %s",
                     "rough area %s"),
              fname="A")
  X



