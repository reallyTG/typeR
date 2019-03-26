library(steadyICA)


### Name: rightskew
### Title: force ICs to have positive skewness and order by skewness
### Aliases: rightskew

### ** Examples

nObs = 1024
simS<-cbind(rgamma(nObs, shape = 1, scale = 2),
            rgamma(nObs, shape = 9, scale = 0.5),
            -1*rgamma(nObs, shape = 3, scale = 2))

apply(simS,2,function(x){ 
  (sum((x - mean(x))^3)/length(x))/(sum((x - mean(x))^2)/length(x))^(3/2)})

canonicalS <- rightskew(simS)

apply(canonicalS,2,function(x){
 (sum((x - mean(x))^3)/length(x))/(sum((x - mean(x))^2)/length(x))^(3/2)})




