library(quantmod)


### Name: Delt
### Title: Calculate Percent Change
### Aliases: Delt
### Keywords: utilities

### ** Examples

Stock.Open <- c(102.25,102.87,102.25,100.87,103.44,103.87,103.00)
Stock.Close <- c(102.12,102.62,100.12,103.00,103.87,103.12,105.12)

Delt(Stock.Open)                    #one period pct. price change
Delt(Stock.Open,k=1)                #same
Delt(Stock.Open,type='arithmetic')  #using arithmetic differences (default)
Delt(Stock.Open,type='log')         #using log differences

Delt(Stock.Open,Stock.Close)        #Open to Close pct. change
Delt(Stock.Open,Stock.Close,k=0:2)  #...for 0,1, and 2 periods




