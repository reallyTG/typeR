library(Rlabkey)


### Name: getFolderPath
### Title: Returns the folder path associated with a session
### Aliases: getFolderPath
### Keywords: file

### ** Examples


# library(Rlabkey)

lks<- getSession("http://www.labkey.org", "/home")
getFolderPath(lks)  #returns "/home"




