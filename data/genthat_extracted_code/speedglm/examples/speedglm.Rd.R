library(speedglm)


### Name: speedglm
### Title: Fitting Generalized Linear Models for Large Data Sets
### Aliases: speedglm.wfit speedglm shglm
### Keywords: models

### ** Examples


## Not run: 
##D # The following comparison among glm(), bigglm() and speedglm() cannot be considered rigorous 
##D # and exhaustive, but it is only to give an idea of the computation time. 
##D # It may take a long time.
##D require(biglm)
##D n<-50000
##D k<-80
##D y <- rgamma(n,1.5,1)
##D x <-round( matrix(rnorm(n*k),n,k),digits=3)
##D colnames(x) <-paste("s",1:k,sep = "")
##D da<- data.frame(y,x)
##D fo <- as.formula(paste("y~",paste(paste("s",1:k,sep=""),collapse="+")))   
##D 
##D system.time(m1 <- glm(fo,data=da,family=Gamma(log)))
##D system.time(m2 <- bigglm(fo,data=da,family=Gamma(log)))
##D system.time(m3 <- speedglm(fo,data=da,family=Gamma(log)))
##D 
##D # You may also try speedglm when R is linked against an optimized BLAS,
##D # otherwise try to run the following function. In some computers, it is
##D # faster for large data sets.
##D system.time(m4 <- speedglm(fo,data=da,family=Gamma(log),set.default=list(row.chunk=1000)))
## End(Not run)
##################
## Not run: 
##D ## An example of function using a connection to an out-memory file  
##D ## This is a slightly modified version of the function from the bigglm's help page 
##D  make.data<-function(filename, chunksize,...){       
##D      conn<-NULL
##D      function(reset=FALSE){
##D      if(reset){
##D        if(!is.null(conn)) close(conn)
##D        conn<<-file(filename,open="r")
##D      } else{
##D        rval<-read.table(conn, nrows=chunksize,...)
##D        if ((nrow(rval)==0)) {
##D             close(conn)
##D             conn<<-NULL
##D             rval<-NULL
##D        }
##D        return(rval)
##D      }
##D   }
##D }
##D 
##D 
##D # data1 is a small toy dataset
##D data(data1)
##D write.table(data1,"data1.txt",row.names=FALSE,col.names=FALSE)
##D rm(data1) 
##D 
##D da<-make.data("data1.txt",chunksize=50,col.names=c("y","fat1","x1","x2"))
##D 
##D # Caution! make sure to close the connection once you have run command #1
##D da(reset=T) #1: opens the connection to "data1.txt"
##D da(reset=F) #2: reads the first 50 rows (out of 100) of the dataset
##D da(reset=F) #3: reads the second 50 rows (out of 100) of the dataset
##D da(reset=F) #4: is NULL: this latter command closes the connection
##D 
##D 
##D require(biglm)        
##D # fat1 is a factor with four levels                                    
##D b1<-shglm(y~factor(fat1)+x1,weights=~I(x2^2),datafun=da,family=Gamma(log))
##D b2<-bigglm(y~factor(fat1)+x1,weights=~I(x2^2),data=da,family=Gamma(log))
##D summary(b1) 
##D summary(b2) 
##D 
##D file.remove("data1.txt")
## End(Not run)



