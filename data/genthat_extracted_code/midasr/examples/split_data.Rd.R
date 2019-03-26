library(midasr)


### Name: split_data
### Title: Split mixed frequency data into in-sample and out-of-sample
### Aliases: split_data

### ** Examples


#Monthly data
x <- 1:24
#Quartely data
z <- 1:8
#Yearly data
y <- 1:2
split_data(list(y=y,x=x,z=z),insample=1,outsample=2)



