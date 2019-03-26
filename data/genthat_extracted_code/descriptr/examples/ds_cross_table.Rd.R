library(descriptr)


### Name: ds_cross_table
### Title: Two way table
### Aliases: ds_cross_table cross_table plot.ds_cross_table ds_twoway_table

### ** Examples

k <- ds_cross_table(mtcarz, cyl, gear)
k

# bar plots
plot(k)
plot(k, stacked = TRUE)
plot(k, proportional = TRUE)

# alternate
ds_twoway_table(mtcarz, cyl, gear)




