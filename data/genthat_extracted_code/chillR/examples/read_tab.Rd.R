library(chillR)


### Name: read_tab
### Title: Read csv table regardless of whether it is a true csv or the
###   French type
### Aliases: read_tab
### Keywords: utility

### ** Examples


df<-data.frame(Var1=c(1,2,3.2,1.2),Var2=c(1.2,6,2.6,7))
write.csv(df,"filecsv.csv",row.names=FALSE)
read_tab("filecsv.csv")
write.table(df,"filesemicolon.csv",sep=";",dec=",")
read_tab("filesemicolon.csv")
file.remove("filecsv.csv")
file.remove("filesemicolon.csv")

 



