library(broom)


### Name: tidy.lavaan
### Title: Tidy a(n) lavaan object
### Aliases: tidy.lavaan lavaan_tidiers sem_tidiers cfa_tidiers

### ** Examples


if (require("lavaan")) {

 library(lavaan)
 
 cfa.fit <- cfa('F =~ x1 + x2 + x3 + x4 + x5 + x6 + x7 + x8 + x9',
                data = HolzingerSwineford1939, group = "school")
 tidy(cfa.fit)
}




