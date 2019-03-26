library(rtrim)


### Name: overall
### Title: Compute overall slope
### Aliases: overall

### ** Examples


# obtain the overall slope accross all change points.
data(skylark)
z <- trim(count ~ site + time, data=skylark, model=2)
overall(z)
plot(overall(z))

# Overall is a list, you can get information out if it using the $ syntax,
# for example
L <- overall(z)
L$slope

# Obtain the slope from changepoint to changepoint
z <- trim(count ~ site + time, data=skylark, model=2,changepoints=c(1,4,6))
# slope from time point 1 to 5
overall(z,changepoints=c(1,5,7))



