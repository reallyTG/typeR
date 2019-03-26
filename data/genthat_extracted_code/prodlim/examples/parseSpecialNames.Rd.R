library(prodlim)


### Name: parseSpecialNames
### Title: Parse special terms
### Aliases: parseSpecialNames

### ** Examples


## ignore arguments
parseSpecialNames("treat(Z)",special="treat")
## set default to 0
parseSpecialNames(c("log(Z)","a","log(B)"),special="log",arguments=list("base"=0))
## set default to 0
parseSpecialNames(c("log(Z,3)","a","log(B,base=1)"),special="log",arguments=list("base"=0))
## different combinations of order and names
parseSpecialNames(c("log(Z,3)","a","log(B,1)"),
                  special="log",
                  arguments=list("base"=0))
parseSpecialNames(c("log(Z,1,3)","a","log(B,u=3)"),
                  special="log",
                  arguments=list("base"=0,"u"=1))
parseSpecialNames(c("log(Z,u=1,base=3)","a","log(B,u=3)"),
                  special="log",
                  arguments=list("base"=0,"u"=1))
parseSpecialNames(c("log(Z,u=1,base=3)","a","log(B,base=8,u=3)"),
                  special="log",
                  arguments=list("base"=0,"u"=1))
parseSpecialNames("treat(Z,u=2)",
                  special="treat",
                  arguments=list("u"=1,"k"=1))
parseSpecialNames(c("treat(Z,1,u=2)","treat(B,u=2,k=3)"),
                  special="treat",
                  arguments=list("u"=NA,"k"=NULL))
## does not work to set default to NULL:
parseSpecialNames(c("treat(Z,1,u=2)","treat(B,u=2)"),
                  special="treat",
                  arguments=list("u"=NA,"k"=NULL))



