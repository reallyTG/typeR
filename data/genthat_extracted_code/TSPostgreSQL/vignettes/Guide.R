### R code from vignette source 'Guide.Stex'

###################################################
### code chunk number 1: Guide.Stex:35-40
###################################################
   user    <- Sys.getenv("POSTGRES_USER")
   host    <- Sys.getenv("POSTGRES_HOST")
   if ("" == host) host  <- Sys.getenv("PGHOST")
   if ("" == host) host  <- "localhost"  #Sys.info()["nodename"] 
   if ("" != user) passwd  <- Sys.getenv("POSTGRES_PASSWD")


