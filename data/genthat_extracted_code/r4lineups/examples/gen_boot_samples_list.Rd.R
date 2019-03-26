library(r4lineups)


### Name: gen_boot_samples_list
### Title: Bootstrapped resampling
### Aliases: gen_boot_samples_list

### ** Examples

#Data:
A <-  round(runif(100,1,6))
B <-  round(runif(70,1,5))
C <-  round(runif(20,1,4))
linelist <- list(A, B, C)
rm(A, B, C)

bootno <- 1000

#Call:
bootdata <- gen_boot_samples_list(linelist, bootno)




