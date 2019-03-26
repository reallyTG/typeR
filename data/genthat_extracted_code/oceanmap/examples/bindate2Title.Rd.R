library(oceanmap)


### Name: bindate2Title
### Title: returns formatted date string for v-plot titles
### Aliases: bindate2Title bindate2main bindate2ylab

### ** Examples

## Example 1: output of different bindate2???-functions
path <- system.file("test_files", package="oceanmap")
gz.files <- Sys.glob(paste0(path,'/*.gz')) # load sample-'.gz'-files
u <- name_split(gz.files)

print(gz.files[1]) # print filename
print(u[1,]) # print splitted filename
bindate2main(u$timestep[1],u$date1[1],u$date2[1]) # main
bindate2Title(u$timestep[1],u$date1[1],u$date2[1]) # Title
bindate2ylab(u$timestep[1],u$date1[1],u$date2[1]) # ylab


## Example 2: Visualize output for multiple '.gz'-files 
u$option <- '... .'

dev.new(width=9.7,height=7.8,xpos=-1)
empty.plot()
box()
for (i in 1:nrow(u)){
  mtext(name_join(u[i,]),side=1,line=i-10)
  main <- bindate2main(u$timestep[i],u$date1[i],u$date2[i]) # main
  Title <- bindate2Title(u$timestep[i],u$date1[i],u$date2[i]) # Title
  ylab <- bindate2ylab(u$timestep[i],u$date1[i],u$date2[i]) # ylab
  mtext(c(Title,ylab,main),side=1:3,line=c(i,nrow(u)+1-i,nrow(u)+1-i))
  mtext(paste("file",i),side=c(1,1:3),line=c(i-10,i,nrow(u)+1-i,nrow(u)+1-i),adj=0)
}
mtext(c("filename",
        "bindate2Title (default)",
         "bindate2ylab (sidelabels=T)",
         "bindate2main  (sidelabels=T)"),
      side=c(1,1:3),line=c(-11,rep(i+2,3)),font=2)




