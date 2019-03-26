library(SWATmodel)


### Name: readSWAT
### Title: Read output.* files from SWAT200*
### Aliases: readSWAT

### ** Examples

## The function is currently defined as
function(outfile){

if (outfile=="sub"){
   varformat="x6,a4,1x,a8,1x,a4,a10,30a10"
   dataformat="x6,i4,1x,i8,1x,i4,f10,30f10"
  } else if (outfile=="rch"){
   varformat="x6,a4,1x,a8,1x,a5,30a12"
   dataformat="x6,i4,1x,i8,1x,i5,30f12"
  } else { print ("You need to add your file type to this function if it is not output.sub or output.rch")}
  print(varformat)
  print(dataformat)
  vfrformat = unlist(strsplit(as.character(varformat), ","))
  dfrformat = unlist(strsplit(as.character(dataformat), ","))
  outvars=read.fortran(paste("output.",outfile,sep=""),vfrformat,skip=8,nrows=1)
  outdata=read.fortran(paste("output.",outfile,sep=""),dfrformat,skip=9,col.names=outvars)
  return(outdata)
  }



