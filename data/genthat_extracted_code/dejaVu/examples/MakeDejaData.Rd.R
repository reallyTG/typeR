library(dejaVu)


### Name: MakeDejaData
### Title: Create a 'DejaData' object
### Aliases: MakeDejaData

### ** Examples


set.seed(232)

my.df <- data.frame(Id=1:100,
                    arm=c(rep(0,50),rep(1,50)),
                    covar=rbinom(n=100,size=1,prob=0.5))

my.df$rate <- 0.0025 + my.df$covar*0.002 + (1-my.df$arm)*0.002

my.dejaData <- MakeDejaData(my.df,arm="arm",rate="rate",Id="Id")




