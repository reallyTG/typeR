library(biglm)


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

## Not run: 
##D ## requires internet access
##D make.data<-function(urlname, chunksize,...){
##D       conn<-NULL
##D      function(reset=FALSE){
##D      if(reset){
##D        if(!is.null(conn)) close(conn)
##D        conn<<-url(urlname,open="r")
##D      } else{
##D        rval<-read.table(conn, nrows=chunksize,...)
##D        if (nrow(rval)==0) {
##D             close(conn)
##D             conn<<-NULL
##D             rval<-NULL
##D        }
##D        return(rval)
##D      }
##D   }
##D }
##D 
##D airpoll<-make.data("http://faculty.washington.edu/tlumley/NO2.dat",
##D         chunksize=150,
##D         col.names=c("logno2","logcars","temp","windsp",
##D                     "tempgrad","winddir","hour","day"))
##D 
##D b<-bigglm(exp(logno2)~logcars+temp+windsp,
##D          data=airpoll, family=Gamma(log),
##D          start=c(2,0,0,0),maxit=10)
##D summary(b)         
## End(Not run)



