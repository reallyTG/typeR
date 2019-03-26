library(R3port)


### Name: ltx_table
### Title: Creates a latex table
### Aliases: ltx_table

### ** Examples


## Not run: 
##D   data(Indometh)
##D   Indometh$id  <- as.numeric(as.character(Indometh$Subject))
##D   Indometh$trt <- ifelse(Indometh$id<4,"trt 1","trt 2")
##D 
##D   ltx_table(Indometh,x=c("trt","time"),y="id",var="conc",
##D             out=tempfile(fileext=".tex"),xabove=TRUE)
##D 
##D   # Usage of multiple y values
##D   ltx_table(Indometh,x="time",y=c("trt","id"),var="conc",
##D             out=tempfile(fileext=".tex"))
##D 
##D   # Some examples for different options
##D   ltx_table(Indometh,x=c("time","trt"),y="id",var="conc",
##D             out=tempfile(fileext=".tex"),yhead=TRUE,
##D             group=1,titlepr="TBL01",title="Dummy table",
##D             footnote="this table is not very informative")
## End(Not run)



