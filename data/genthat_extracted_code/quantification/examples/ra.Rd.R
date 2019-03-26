library(quantification)


### Name: ra
### Title: Regression approach
### Aliases: ra

### ** Examples

## Data preparation: generate a sample dataset with inflation and survey data
inflation<-c(1.7, 1.9, 2, 1.9, 2, 2.1, 2.1, 2.1, 2.4, 2.3, 2.4)
answer.up<-c(67, 75.1, 76.4, 72.4, 69.7, 49.7, 45.2, 31.6, 14.9, 19.3, 19.2)
answer.same<-c(30.1, 19.6, 19.5, 21.3, 20.1, 33.1, 34.4, 33.5, 44.6, 38.1, 35.3)
answer.down<-c(2.9, 5.3, 4.1, 6.3, 10.2, 17.2, 20.4, 34.9, 40.5, 42.6, 45.5)

## Call ra for quantification
quant.ra<-ra(inflation, answer.up, answer.same, answer.down, first.period=5, 
	last.period=7, forecast.horizon=4, symmetry.error="small.sample")



