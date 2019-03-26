library(heemod)


### Name: define_surv_table
### Title: Define a survival distribution based on explicit survival
###   probabilities
### Aliases: define_surv_table define_surv_table.data.frame
###   define_surv_table.character

### ** Examples

 x <- data.frame(time = c(0, 1, 5, 10), survival = c(1, 0.9, 0.7, 0.5))
 define_surv_table(x)
 



