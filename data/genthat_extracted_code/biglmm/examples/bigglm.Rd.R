library(biglmm)


### Name: bigglm
### Title: Bounded memory linear regression
### Aliases: bigglm bigglm.function bigglm.data.frame
###   bigglm.SQLiteConnection bigglm.RODBC vcov.bigglm deviance.bigglm
###   family.bigglm AIC.bigglm bigglm,ANY,DBIConnection-method
### Keywords: regression

### ** Examples

data(trees)
ff<-log(Volume)~log(Girth)+log(Height)
a <- bigglm(ff,data=trees, chunksize=10, sandwich=TRUE)
summary(a)

gg<-log(Volume)~log(Girth)+log(Height)+offset(2*log(Girth)+log(Height))
b <- bigglm(gg,data=trees, chunksize=10, sandwich=TRUE)
summary(b)

## No test: 
## requires internet access
make.data<-function(urlname, chunksize,...){
      conn<-NULL
     function(reset=FALSE){
     if(reset){
       if(!is.null(conn)) close(conn)
       conn<<-url(urlname,open="r")
     } else{
       rval<-read.table(conn, nrows=chunksize,...)
       if (nrow(rval)==0) {
            close(conn)
            conn<<-NULL
            rval<-NULL
       }
       return(rval)
     }
  }
}

airpoll<-make.data("http://faculty.washington.edu/tlumley/NO2.dat",
        chunksize=150,
        col.names=c("logno2","logcars","temp","windsp",
                    "tempgrad","winddir","hour","day"))

b<-bigglm(exp(logno2)~logcars+temp+windsp,
         data=airpoll, family=Gamma(log),
         start=c(2,0,0,0),maxit=10)
summary(b)         
## End(No test)



