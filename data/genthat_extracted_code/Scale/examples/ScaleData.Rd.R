library(Scale)


### Name: Scale
### Title: Define Data Set, Reverse Items and Alternate Orders
### Aliases: ScaleData Scale
### Keywords: survey multivariate

### ** Examples

data(Depression98)
depressionScale <- Scale(data=Depression98, 
                          orders=list(
                            c(16,19,11,9,1,17,5,18,4,8,2,12,
                              20,10,14,6,3,13,15,7),
                            c(1,18,4,15,7,8,3,14,20,6,19,16,
                            12,5,10,13,2,17,11,9)),
                            orders_id=c(
                                        rep(1, 49),
                                        rep(2, 49)),
                            reverse=c(3,4,13,14,18,20),
                            col_names= paste('q', 1:20, sep=''))
str(depressionScale)



