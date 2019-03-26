library(moult)


### Name: predict.moult
### Title: Predict method for moult models
### Aliases: predict.moult coef.moult

### ** Examples


data(sanderlings)

m2 <- moult(MIndex ~ Day, data = sanderlings)                     
m3 <- moult(MIndex ~ Day, data = sanderlings, type = 3)           

## number of birds observed on each of the days
(nn <- as.numeric(table(sanderlings$Day)))

## unique observation days 
(day <- unique(sanderlings$Day))

## Table 6 in Underhill and Zucchini 1988
## expected number of birds in each moult stage on each day
p1 <- predict(m2, newdata = data.frame(day))        
p1$M * nn						

## Table 7 in Underhill and Zucchini 1988
## expected number of birds in each moult stage for days 70 to 310
days2 <- seq(70, 310, by = 10)
p2 <- predict(m2, newdata = data.frame(days2))
p2$M * 100        
                    
(p3 <- predict(m3, newdata = data.frame(day)))




