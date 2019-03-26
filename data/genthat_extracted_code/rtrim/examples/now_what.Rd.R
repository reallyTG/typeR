library(rtrim)


### Name: now_what
### Title: Give advice on further refinement of TRIM models
### Aliases: now_what

### ** Examples


data(skylark)
z <- trim(count ~ site + time, data=skylark, model=2, overdisp=TRUE)
now_what(z)



