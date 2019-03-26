library(EasyHTMLReport)


### Name: simpleHtmlReport
### Title: simple html report
### Aliases: simpleHtmlReport

### ** Examples

## Not run: 
##D A <- data.frame(id=c("2013-08-01","2013-08-02","2013-08-03",
##D                   "2013-08-04","2013-08-05"),
##D                 variable="A",
##D                 value=c(100,123,130,125,140))
##D B <- data.frame(id=c("2013-08-01","2013-08-02","2013-08-03",
##D                   "2013-08-04","2013-08-05"),
##D                 variable="B",
##D                 value=c(90,100,120,140,110))
##D C <- data.frame(id=c("2013-08-01","2013-08-02","2013-08-03",
##D                   "2013-08-04","2013-08-05"),
##D                 variable="C",
##D                 value=c(150,130,150,160,150))
##D 
##D data1 <- rbind(A,B,C)
##D 
##D set.seed(2)
##D data2 <- data1
##D data2$value <- data2$value*100 + rnorm(nrow(data2),0,100)
##D 
##D set.seed(4)
##D data3 <- data1
##D data3$value <- data2$value*100 + rnorm(nrow(data2),0,50)
##D 
##D simpleHtmlReport("Simple HTML Report",
##D                  "yokkuns@localhost",
##D                  "yohei0511@gmail.com",
##D                  "simpleHtmlReport Test",
##D                  report.data=list(
##D                      "Report1" = list(data=data1),
##D                      "Report2" = list(data=data2),
##D                      "Report3" = list(data=data3)
##D                  ))
## End(Not run)



