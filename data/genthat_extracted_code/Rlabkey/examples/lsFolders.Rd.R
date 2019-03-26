library(Rlabkey)


### Name: lsFolders
### Title: List the available folder paths
### Aliases: lsFolders
### Keywords: file

### ** Examples


##get a list if projects and folders
# library(Rlabkey)

lks<- getSession("http://www.labkey.org", "/home")

#returns values "/home" , "/home/_menus" , ...
lsFolders(lks)




