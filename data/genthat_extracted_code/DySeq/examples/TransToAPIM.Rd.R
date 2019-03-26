library(DySeq)


### Name: TransToAPIM
### Title: TransToAPIM
### Aliases: TransToAPIM

### ** Examples



test<-matrix(c(0.41 , 0.28 , 0.19 , 0.12,
              0.18 , 0.18 , 0.32 , 0.32,
              0.18 , 0.22 , 0.27 , 0.33,
              0.05 , 0.09 , 0.30 , 0.55) , 4 , 4 , byrow = TRUE)

x<-TransToAPIM(test)
# inspecting the beta-coefficients
x

#backtesting (last row will show minor errors caused by rounding)
round(APIMtoTrans(x[1],x[2],x[3],x[4],x[5],x[6],x[7],x[8]),2)




