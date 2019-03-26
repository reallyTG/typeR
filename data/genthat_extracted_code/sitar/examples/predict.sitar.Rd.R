library(sitar)


### Name: predict.sitar
### Title: Predict SITAR model
### Aliases: predict.sitar

### ** Examples


data(heights)
## fit model
m1 <- sitar(x=age, y=height, id=id, data=heights, df=5)

## predictions at level 0
predict(m1, newdata=data.frame(age=9:16), level=0)

## predictions at level 1 for subject 5
predict(m1, newdata=data.frame(age=9:16, id=5), level=1)

## velocity predictions for subjects with early and late puberty
vel1 <- predict(m1, deriv=1, abc=c(b=-1))
mplot(age, vel1, id, heights, col=id)
vel1 <- predict(m1, deriv=1, abc=c(b=1))
mplot(age, vel1, id, heights, col=id, add=TRUE)




