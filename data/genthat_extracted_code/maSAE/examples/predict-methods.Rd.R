library(maSAE)


### Name: predict
### Title: Methods for Function 'predict'
### Aliases: predict predict,sadObj-method predict,saeObj-method
###   predict-methods
### Keywords: area estimation methods, small

### ** Examples

library('maSAE')
## ## design-based estimation
## load data
data('s2')
## create object
saeO  <- saObj(data = s2, f = y ~ NULL | g)
## design-based estimation for all small areas given by g
predict(saeO)

## ## model-assisted estimation
## load s1 data
data('s1'); str(s1)
## add sample indicators to s2
s2$s1 <- s2$s2 <- TRUE
## add sample indicators to s1
s1$s1 <- TRUE
s1$s2 <- FALSE
## prepare s1 data
eval(parse(text=(paste('s1$', setdiff(names(s2), names(s1)), ' <- NA' , sep = ''))))
## union s1 and s2 data
s12 <- rbind(s1, s2)
## create object
saeO <- saObj(data = s12, f = y ~x1 + x2 + x3 | g, s2 = 's2')
## small area estimation
p <- predict(saeO)
## print p and view its attributes set by predict()
p; 
str(p)
cat(sep = '\n', attr(p, 'references')[2])
attributes(p$prediction)
attributes(p$variance)



