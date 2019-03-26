library(carx)


### Name: cenTS
### Title: Create a censored time series object of 'cenTS' class
### Aliases: cenTS

### ** Examples

strDates <- c("2000-01-01", "2000-01-02", "2000-01-03", "2000-01-04", "2000-01-05")
ts <- cenTS(value=c(1,-2,1,NA,0),
            order.by=as.Date(strDates,"%Y-%m-%d"),
            lcl=c(-3,-2,-1,-1,0),
            ucl=c(3,2,1,1,1),
            x=c(1,1,1,1,1),
            y=c(2,2,2,2,2))
 print(ts)
 print(xreg(ts))
 plot(ts)

## Not run: 
##D #wrong call, case 1
##D ts <- cenTS(value=c(1,-2,1,NA,0),
##D            order.by=as.Date(strDates,"%Y-%m-%d"),
##D            lcl=c(-3,-2,-1,-1,0),
##D            ucl=c(3,2,1,1,1),
##D            ci =c(-1,-1,1,NA,-1)
##D )
##D #wrong call, case 2
##D ts <- cenTS(value=c(1,-2,1,NA,0),
##D            order.by=as.Date(strDates,"%Y-%m-%d"),
##D            lcl=c(-3,-2,-1,-1,0),
##D            ucl=c(3,2,1,1,1),
##D            ci =c(1,-1,1,NA,-1)
##D )
##D 
##D 
##D #wrong call, case 3
##D ts <- cenTS(value=c(1,-2,1,NA,0),
##D            order.by=as.Date(strDates,"%Y-%m-%d"),
##D            lcl=c(-3,-2,-1,-1,0),
##D            ucl=c(3,2,1,1,1),
##D            ci =c(0,-1,0,NA,-1)
##D )
## End(Not run)




