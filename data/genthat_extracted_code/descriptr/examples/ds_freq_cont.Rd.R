library(descriptr)


### Name: ds_freq_cont
### Title: Frequency distribution of continuous data
### Aliases: ds_freq_cont freq_cont plot.ds_freq_cont

### ** Examples

# frequency table
ds_freq_cont(mtcarz, mpg, 4)

# histogram
k <- ds_freq_cont(mtcarz, mpg, 4)
plot(k)




