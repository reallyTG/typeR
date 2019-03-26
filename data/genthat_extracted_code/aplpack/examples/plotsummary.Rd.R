library(aplpack)


### Name: plotsummary
### Title: graphical summaries of variables of a data set
### Aliases: plotsummary
### Keywords: hplot manip

### ** Examples
                                                        
 ##---- Should be DIRECTLY executable !! ----         
 ##-- ==>  Define data, use random,                      
 ##--\tor do  help(data=index)  for the standard data sets.   
 plotsummary(cars)
 plotsummary(cars, types=c("ecdf", "density", "boxplot"), 
             y.sizes = c(1,1,1), design ="stripes")
 plotsummary(c(list(rivers=rivers, co2=co2), cars), y.sizes=c(10,3,3,1), mycols=3)
 plotsummary(cars, design="chessboard")
 # find all matrices in your R
 ds.of.R <- function(type="vector"){
   dat <- ls(pos=grep("datasets",search()))
   dat.type <- unlist(lapply(dat,function(x) {       
      num <- mode(x<-eval(parse(text=x)))
      num <- ifelse(is.array(x),"array",num)
      num <- ifelse(is.list(x),"list",num)
      num <- ifelse(is.matrix(x),"matrix",num)
      num <- ifelse(is.data.frame(x),"matrix",num)
      num <- ifelse(num=="numeric","vector",num)
      num }))
   return(dat[dat.type==type])
 }
 namelist <- ds.of.R("matrix")
 # inspect the matrices one after the other
 for(i in seq(along=namelist)){
   print(i); print(namelist[i])
   xy <- get(namelist[i])
   # plotsummary(xy,y.sizes=4:1,trim=.05,main=namelist[i]) 
   # Sys.sleep(1)
 }
 


