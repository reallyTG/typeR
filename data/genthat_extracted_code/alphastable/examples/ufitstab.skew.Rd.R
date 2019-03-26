library(alphastable)


### Name: ufitstab.skew
### Title: ufitstab.skew
### Aliases: ufitstab.skew

### ** Examples

# For example, We use the daily price returns of Abbey National shares. Using the initial
# values as alpha_{0}=0.8, beta_{0}=0, sigma_{0}=0.25, and mu_{0}=0.25.
price<-c(296,296,300,302,300,304,303,299,293,294,294,293,295,287,288,297,
         305,307,304,303,304,304,309,309,309,307,306,304,300,296,301,298,
         295,295,293,292,307,297,294,293,306,303,301,303,308,305,302,301,
         297,299)
x<-c()
n<-length(price)
for(i in 2:n){x[i]<-(price[i-1]-price[i])/price[i-1]}
library("stabledist")
## No test: 
ufitstab.skew(x[2:n],0.8,0,0.25,0.25,1)
## End(No test)



