library(broom)


### Name: glance.lavaan
### Title: Glance at a(n) lavaan object
### Aliases: glance.lavaan

### ** Examples


if (require("lavaan", quietly = TRUE)) {

 library(lavaan)

 cfa.fit <- cfa(
   'F =~ x1 + x2 + x3 + x4 + x5',
   data = HolzingerSwineford1939, group = "school"
 )
 glance(cfa.fit)

}




