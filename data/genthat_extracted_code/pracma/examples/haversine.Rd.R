library(pracma)


### Name: haversine
### Title: Haversine Formula
### Aliases: haversine
### Keywords: geom

### ** Examples

FRA = '50 02 00N, 08 34 14E'  # Frankfurt Airport
ORD = '41 58 43N, 87 54 17W'  # Chicago O'Hare Interntl. Airport
fra <- c(50+2/60, 8+34/60+14/3600)
ord <- c(41+58/60+43/3600, -(87+54/60+17/3600))

dis <- haversine(FRA, ORD)    # 6971.059 km
fprintf('Flight distance Frankfurt-Chicago is %8.3f km.\n', dis)

dis <- haversine(fra, ord)
fprintf('Flight distance Frankfurt-Chicago is %8.3f km.\n', dis)



