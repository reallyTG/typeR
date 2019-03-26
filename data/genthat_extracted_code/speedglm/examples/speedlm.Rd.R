library(speedglm)


### Name: speedlm
### Title: Fitting Linear Models to Large Data Sets
### Aliases: speedlm speedlm.fit speedlm.wfit update.speedlm
###   updateWithMoreData
### Keywords: models

### ** Examples

## Not run: 
##D n <- 1000
##D k <- 3
##D y <- rnorm(n)
##D x <- round(matrix(rnorm(n * k), n, k), digits = 3)
##D colnames(x) <- c("s1", "s2", "s3") 
##D da <- data.frame(y, x)
##D do1 <- da[1:300,]
##D do2 <- da[301:700,]
##D do3 <- da[701:1000,]
##D 
##D m1 <- speedlm(y ~ s1 + s2 + s3, data = do1)
##D m1 <- update(m1, data = do2)
##D m1 <- update(m1, data = do3)
##D 
##D m2 <- lm(y ~ s1 + s2 + s3, data = da)
##D summary(m1)
##D summary(m2)
## End(Not run)

## Not run: 
##D   # as before but recursively
##D   make.data <- function(filename, chunksize,...){       
##D     conn <- NULL
##D     function(reset=FALSE, header=TRUE){
##D       if(reset){
##D         if(!is.null(conn)) close(conn)
##D          conn<<-file(filename,open="r") 
##D       } else{
##D         rval <- read.table(conn, nrows=chunksize,header=header,...)
##D         if (nrow(rval)==0) {
##D           close(conn)
##D           conn<<-NULL
##D           rval<-NULL
##D         }
##D         return(rval)
##D       }
##D     }
##D   }
##D 
##D   write.table(da,"da.txt",col.names=TRUE,row.names=FALSE,quote=FALSE) 
##D   x.names <- c("s1", "s2", "s3")
##D   dat <- make.data("da.txt",chunksize=300,col.names=c("y",x.names))
##D   dat(reset=TRUE) 
##D   da2 <- dat(reset=FALSE)
##D   
##D   # the first model runs on the first 300 rows.
##D   m3 <- speedlm(y ~ s1 + s2 + s3, data=da2)
##D 
##D   # the last three models run on the subsequent 300, 300 and 100 rows, respectively
##D   for (i in 1:3){
##D     da2 <- dat(reset=FALSE, header=FALSE)
##D     m3 <- update(m3, data=da2, add=TRUE)
##D   }  
##D   all.equal(coef(m1),coef(m3))  
##D   file.remove("da.txt")
## End(Not run)




