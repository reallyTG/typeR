library(preputils)


### Name: coalesce
### Title: select 1st existing value of several columns
### Aliases: coalesce

### ** Examples

    a1 = c(1,NA,NA,NA)
    a2 = c(2,2,NA,NA)
    a3 = c(NA,3,3,NA)
    cbind(a1,a2,a3,suppl=coalesce(a1,a2,a3))



