library(carx)


### Name: print.cenTS
### Title: Print a 'cenTS' object
### Aliases: print.cenTS

### ** Examples

strDates <- c("2000-01-01", "2000-01-02", "2000-01-03", "2000-01-04", "2000-01-05")
ts <- cenTS(value=c(1,-2,1,NA,0),
            order.by=as.Date(strDates,"%Y-%m-%d"),
            lcl=c(-3,-2,-1,-1,0),
            ucl=c(3,2,1,1,1),
            x=c(1,1,1,1,1),
            y=c(2,2,2,2,2))
 print(ts)




